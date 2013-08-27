//
//  BulletSprite.m
//  planeWar
//
//  Created by croath on 13-8-27.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "BulletSprite.h"

@implementation BulletSprite

- (instancetype)newBulletWithType:(BulletType)type{
  BulletSprite *sprite;
  if (type == BulletTypeNormal) {
    sprite = [BulletSprite spriteNodeWithImageNamed:@"z1"];
    [sprite setPower:1.f];
  } else {
    sprite = [BulletSprite spriteNodeWithImageNamed:@"z2"];
    [sprite setPower:2.f];
  }
  
  [sprite setSpeed:20.f];
  [sprite setBulletType:type];
  [sprite setScale:0.5f];
  
  SKPhysicsBody *pb = [SKPhysicsBody bodyWithRectangleOfSize:sprite.size];
  [pb setCategoryBitMask:BulletMask];
  [pb setCollisionBitMask:EnemyPlaneMask];
  [pb setContactTestBitMask:EnemyPlaneMask];
  [pb setUsesPreciseCollisionDetection:YES];
  [pb setAffectedByGravity:NO];
  [pb setDynamic:YES];
  [pb setAllowsRotation:NO];
  
  [sprite setPhysicsBody:pb];
  return sprite;
}

- (instancetype)newBulletWithType:(BulletType)type position:(CGPoint)position{
  BulletSprite *sprite;
  [sprite setPosition:position];
  return sprite;
}

@end
