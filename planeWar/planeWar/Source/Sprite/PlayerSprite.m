//
//  PlayerSprite.m
//  planeWar
//
//  Created by croath on 13-8-26.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "PlayerSprite.h"

@implementation PlayerSprite

+ (instancetype)newPlayer{
  PlayerSprite *sprite = [PlayerSprite spriteNodeWithImageNamed:@"plane"];
  [sprite setScale:0.5f];
  
  [sprite setMaxBlood:1.f];
  return sprite;
}

+ (instancetype)newPlayerAtPostion:(CGPoint)position{
  PlayerSprite *sprite = [self newPlayer];
  [sprite setPosition:position];
  return sprite;
}

@end
