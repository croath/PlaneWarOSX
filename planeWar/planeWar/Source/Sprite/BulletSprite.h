//
//  BulletSprite.h
//  planeWar
//
//  Created by croath on 13-8-27.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PhysicsMasks.h"

typedef enum{
  BulletTypeNormal,
  BulletTypePro
}BulletType;

@interface BulletSprite : SKSpriteNode

@property (nonatomic) CGFloat power;
@property (nonatomic) CGFloat speed;
@property (nonatomic) BulletType bulletType;

+ (instancetype)newBulletWithType:(BulletType)type;
+ (instancetype)newBulletWithType:(BulletType)type position:(CGPoint)position;
@end
