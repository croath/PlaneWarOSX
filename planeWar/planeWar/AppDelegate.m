//
//  AppDelegate.m
//  planeWar
//
//  Created by croath on 13-8-24.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "AppDelegate.h"
#import "MainScene.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  /* Pick a size for the scene */
  SKScene *scene = [MainScene sceneWithSize:CGSizeMake(320, 600)];
  
  /* Set the scale mode to scale to fit the window */
  scene.scaleMode = SKSceneScaleModeAspectFit;
  
  [self.skView presentScene:scene];
  
  self.skView.showsFPS = YES;
  self.skView.showsNodeCount = YES;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
  return YES;
}

@end
