//
//  MyScene.m
//  planeWar
//
//  Created by croath on 13-8-24.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "MainScene.h"
#import "PlayerSprite.h"
#import "EnemySprite.h"
#import "BulletSprite.h"

#define ENEMIES_MAX_COUNT     100
#define BULLET_RATE           15

#define ENEMY_MIDDIUM_RATE    10
#define ENEMY_LARGE_RATE      21

@interface MainScene(){
  NSUInteger _score;
  SKLabelNode *_scoreLabel;
  
  SKSpriteNode *_player;
  
  NSMutableArray *_enemiesArray;
}

@end

@implementation MainScene

-(id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    self.backgroundColor = [SKColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    [self.physicsWorld setContactDelegate:self];
    
    [self addScoreLabel];
    [self setUpPlayer];
    [self setUpEnemies];
  }
  return self;
}

- (void)addScoreLabel{
  _scoreLabel = [[SKLabelNode alloc] init];
  _scoreLabel.fontColor = [SKColor blackColor];
  _scoreLabel.text = @"0";
  _scoreLabel.fontSize = 15;
  _scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMaxY(self.frame) - 15);
  _scoreLabel.zPosition = 10;
  
  [self addChild:_scoreLabel];
}

- (void)setUpPlayer{
  _player = [PlayerSprite newPlayerAtPostion:CGPointMake(CGRectGetMidX(self.frame), 50)];
  _player.zPosition = 10.f;
  _player.scale = 0.5;
  [self addChild:_player];
}

- (void)setUpEnemies{
  if (_enemiesArray == nil) {
    _enemiesArray = [NSMutableArray arrayWithCapacity:ENEMIES_MAX_COUNT];
    for (int i = 0; i < ENEMIES_MAX_COUNT; i ++) {
      EnemySprite *sprite;
      
      if (i % ENEMY_LARGE_RATE == 0) {
        sprite = [EnemySprite newEnemyWithEnemyType:EnemyTypeLarge];
      } else if (i % ENEMY_MIDDIUM_RATE == 0) {
        sprite = [EnemySprite newEnemyWithEnemyType:EnemyTypeMiddium];
      } else {
        sprite = [EnemySprite newEnemyWithEnemyType:EnemyTypeSmall];
      }
      if (sprite.parent != self) {
        [_enemiesArray addObject:sprite];
      }
    }
  }
}

static int bullet_setup_count = 0;
- (void)setUpOneBullet{
  if (bullet_setup_count >= BULLET_RATE) {
    bullet_setup_count = 0;
  } else {
    bullet_setup_count ++;
    return;
  }
  
  @autoreleasepool {
    NSPoint position = _player.position;
    BulletSprite *bullet = [BulletSprite newBulletWithType:BulletTypeNormal position:position];
    [self addChild:bullet];
    
    NSPoint dest  = CGPointMake(position.x, position.y + CGRectGetHeight(self.frame) / 2.f);
    CGFloat time = fabs(dest.y - position.y) / bullet.speed;
    SKAction *action = [SKAction moveTo:dest duration:time];
    [bullet runAction:action completion:^{
      [bullet removeFromParent];
    }];
  }
}

- (EnemySprite*)availabelSprite{
  int rand_count = rand() % [_enemiesArray count];
  EnemySprite *sprite = [_enemiesArray objectAtIndex:rand_count];
  if (sprite != nil && sprite.parent != self) {
    [sprite removeAllActions];
    return sprite;
  }
  return nil;
}

-(void)update:(CFTimeInterval)currentTime {
  /* Called before each frame is rendered */
  [self movePlayer];
  [self addEnemies];
  [self setUpOneBullet];
}

- (void)movePlayer{
  NSPoint mouseLoc = [MainView mousePoint];
  SKAction *action = [SKAction moveTo:mouseLoc duration:0.05];
  [_player runAction:action];
}

- (void)addEnemies{
  EnemySprite *sprite = [self availabelSprite];
  if (rand() % 77 == 0) {
    CGFloat x = random()%1000*((CGRectGetMaxX(self.frame) - sprite.size.width)/1000) + sprite.size.width/2;
    CGPoint position = CGPointMake(x, CGRectGetMaxY(self.frame) + sprite.size.height);
    NSLog(@"%f", position.y);
    [sprite setPosition:position];
    CGPoint dest = CGPointMake(x, -sprite.size.height);
    [self addChild:sprite];
    
    CGFloat time = fabs(dest.y - position.y) / sprite.speed;
    SKAction *action = [SKAction moveTo:dest duration:time];
    
    [sprite runAction:action completion:^{
      [sprite removeFromParent];
    }];
  }
}

- (void)updateScore{
  [_scoreLabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)_score]];
}

- (void)restart{
  _score = 0;
  [self updateScore];
  [self removeChildrenInArray:_enemiesArray];
  [self setUpEnemies];
}

- (void)didBeginContact:(SKPhysicsContact *)contact{
  if ([contact.bodyA.node isKindOfClass:[PlayerSprite class]] ||
      [contact.bodyB.node isKindOfClass:[PlayerSprite class]]) {
    [self restart];
  } else {
    [contact.bodyA.node removeAllActions];
    [contact.bodyA.node removeFromParent];
    
    [contact.bodyB.node removeAllActions];
    [contact.bodyB.node removeFromParent];
    
    EnemySprite *sprite;
    if ([contact.bodyA.node isKindOfClass:[EnemySprite class]]) {
      sprite = (EnemySprite*)contact.bodyA.node;
    } else {
      sprite = (EnemySprite*)contact.bodyB.node;
    }
    _score += sprite.score;
    [self updateScore];
  }
}
@end
