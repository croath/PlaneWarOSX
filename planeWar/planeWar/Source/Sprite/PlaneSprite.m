//
//  PlaneSprite.m
//  planeWar
//
//  Created by croath on 13-8-26.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "PlaneSprite.h"

@implementation PlaneSprite

- (void)setMaxBlood:(CGFloat)maxBlood{
  _maxBlood = maxBlood;
  [self setBlood:maxBlood];
}

@end
