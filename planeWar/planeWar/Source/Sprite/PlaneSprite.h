//
//  PlaneSprite.h
//  planeWar
//
//  Created by croath on 13-8-26.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PhysicsMasks.h"

@interface PlaneSprite : SKSpriteNode

@property (nonatomic) CGFloat speed;
@property (nonatomic) CGFloat blood;
@property (nonatomic) CGFloat maxBlood;

@end
