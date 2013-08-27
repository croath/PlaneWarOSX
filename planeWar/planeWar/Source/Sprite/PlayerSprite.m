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
  
  SKPhysicsBody *pb = [SKPhysicsBody bodyWithCircleOfRadius:sprite.size.width/16];
  [pb setCategoryBitMask:PlayerPlaneMask];
  [pb setCollisionBitMask:EnemyPlaneMask];
  [pb setContactTestBitMask:EnemyPlaneMask];
  [pb setUsesPreciseCollisionDetection:YES];
  [pb setAffectedByGravity:NO];
  [pb setDynamic:YES];
  [pb setAllowsRotation:NO];
  
  [sprite setPhysicsBody:pb];
  return sprite;
}

+ (instancetype)newPlayerAtPostion:(CGPoint)position{
  PlayerSprite *sprite = [self newPlayer];
  [sprite setPosition:position];
  return sprite;
}

@end
