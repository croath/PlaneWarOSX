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

#define ENEMIES_MAX_COUNT     100

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
  _enemiesArray = [NSMutableArray arrayWithCapacity:ENEMIES_MAX_COUNT];
  for (int i = 0; i < ENEMIES_MAX_COUNT; i ++) {
    EnemySprite *sprite = [EnemySprite newEnemyWithEnemyType:EnemyTypeSmall];
    [_enemiesArray addObject:sprite];
  }
}

- (EnemySprite*)availabelSprite{
  for (EnemySprite *sprite in _enemiesArray) {
    if (![sprite inScene]) {
      return sprite;
    }
  }
  return nil;
}

-(void)update:(CFTimeInterval)currentTime {
  /* Called before each frame is rendered */
  [self movePlayer];
  [self addEnemies];
}

- (void)movePlayer{
  NSPoint mouseLoc = [MainView mousePoint];
  SKAction *action = [SKAction moveTo:mouseLoc duration:0.05];
  [_player runAction:action];
}

- (void)addEnemies{
  EnemySprite *sprite = [self availabelSprite];
  if (sprite != nil && rand() % 77 == 0) {
    [sprite setInScene:YES];
    CGFloat x = random()%1000*((CGRectGetMaxX(self.frame) - sprite.frame.size.width)/1000) + sprite.frame.size.width/2;
    CGPoint position = CGPointMake(x, CGRectGetMaxY(self.frame) + sprite.frame.size.height);
    [sprite setPosition:position];
    CGPoint dest = CGPointMake(x, -sprite.frame.size.height);
    [self addChild:sprite];
    
    CGFloat time = fabs(dest.y - position.y) / sprite.speed;
    SKAction *action = [SKAction moveTo:dest duration:time];
    
    [sprite runAction:action completion:^{
      [sprite setInScene:NO];
      [sprite removeFromParent];
      _score += 1000;
      [self updateScore];
    }];
  }
}

- (void)updateScore{
  [_scoreLabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)_score]];
}

- (void)didBeginContact:(SKPhysicsContact *)contact{
  _score = 0;
  [self updateScore];
}

- (void)didEndContact:(SKPhysicsContact *)contact{
  
}
@end
