//
//  EnemySprite.h
//  planeWar
//
//  Created by croath on 13-8-26.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "PlaneSprite.h"

typedef enum{
  EnemyTypeSmall,
  EnemyTypeMiddium,
  EnemyTypeLarge
}EnemyType;

@interface EnemySprite : PlaneSprite

@property (nonatomic) EnemyType enemyType;

- (CGFloat)score;

+ (instancetype)newEnemyWithEnemyType:(EnemyType)type;
+ (instancetype)newEnemyWithEnemyType:(EnemyType)type postion:(CGPoint)position;

@end
