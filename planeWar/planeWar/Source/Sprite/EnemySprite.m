//
//  EnemySprite.m
//  planeWar
//
//  Created by croath on 13-8-26.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "EnemySprite.h"

@implementation EnemySprite

+ (instancetype)newEnemyWithEnemyType:(EnemyType)type{
  EnemySprite *sprite;
  switch (type) {
    case EnemyTypeMiddium:
      sprite = [EnemySprite spriteNodeWithImageNamed:@"enemy2"];
      [sprite setMaxBlood:3.f];
      break;
    case EnemyTypeLarge:
      sprite = [EnemySprite spriteNodeWithImageNamed:@"enemy3"];
      [sprite setMaxBlood:10.f];
      break;
    case EnemyTypeSmall:
    default:
      sprite = [EnemySprite spriteNodeWithImageNamed:@"enemy1"];
      [sprite setMaxBlood:1.f];
      break;
  }
  
  [sprite setEnemyType:type];
  [sprite setScale:0.5f];
  [sprite setSpeed:10.f];
  
  SKPhysicsBody *pb = [SKPhysicsBody bodyWithRectangleOfSize:sprite.size];
  [pb setCategoryBitMask:EnemyPlaneMask];
  [pb setCollisionBitMask:PlayerPlaneMask | BulletMask];
  [pb setContactTestBitMask:PlayerPlaneMask | BulletMask];
  [pb setUsesPreciseCollisionDetection:YES];
  [pb setAffectedByGravity:NO];
  [pb setDynamic:YES];
  [pb setAllowsRotation:NO];
  
  [sprite setPhysicsBody:pb];
  return sprite;
}

+ (instancetype)newEnemyWithEnemyType:(EnemyType)type postion:(CGPoint)position{
  EnemySprite *sprite = [self newEnemyWithEnemyType:type];
  [sprite setPosition:position];
  return sprite;
}

@end
