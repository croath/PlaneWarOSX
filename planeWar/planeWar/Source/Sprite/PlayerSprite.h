//
//  PlayerSprite.h
//  planeWar
//
//  Created by croath on 13-8-26.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PlaneSprite.h"

@interface PlayerSprite : PlaneSprite

+ (instancetype)newPlayer;
+ (instancetype)newPlayerAtPostion:(CGPoint)position;
@end
