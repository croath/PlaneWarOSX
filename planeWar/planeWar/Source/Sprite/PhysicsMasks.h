//
//  PhysicsMasks.h
//  planeWar
//
//  Created by croath on 13-8-27.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#ifndef planeWar_PhysicsMasks_h
#define planeWar_PhysicsMasks_h

typedef enum{
  PlayerPlaneMask    = 0x1 << 0,
  EnemyPlaneMask     = 0x1 << 1,
  BulletMask         = 0x1 << 2
}PhysicsTypeBit;

#endif
