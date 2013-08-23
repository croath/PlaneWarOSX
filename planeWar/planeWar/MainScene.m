//
//  MyScene.m
//  planeWar
//
//  Created by croath on 13-8-24.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "MainScene.h"

@interface MainScene(){
  SKLabelNode *_scoreLabel;
  SKSpriteNode *_player;
}

@end

@implementation MainScene

-(id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    self.backgroundColor = [SKColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    [self addScoreLabel];
    [self setUpPlayer];
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
  
  [self addChild:_scoreLabel];
}

- (void)setUpPlayer{
  _player = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
  _player.position = CGPointMake(CGRectGetMidX(self.frame), 50);
  _player.scale = 0.2;
  [self addChild:_player];
}

- (void)mouseMoved:(NSEvent *)theEvent{
  
}

-(void)update:(CFTimeInterval)currentTime {
  /* Called before each frame is rendered */
  NSPoint mouseLoc = [MainView mousePoint];
  SKAction *action = [SKAction moveTo:mouseLoc duration:0.05];
  [_player runAction:action];
}

@end
