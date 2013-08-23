//
//  AppDelegate.h
//  planeWar
//

//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <SpriteKit/SpriteKit.h>
#import "MainView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet MainView *skView;

@end
