//
//  MainView.m
//  planeWar
//
//  Created by croath on 13-8-24.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "MainView.h"

@implementation MainView

static NSPoint _point;

- (void)awakeFromNib{
  NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:[self visibleRect]
                                                              options:NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingInVisibleRect |NSTrackingActiveAlways
                                                                owner:self
                                                             userInfo:nil];
	
	[self addTrackingArea:trackingArea];
}

- (void)mouseMoved:(NSEvent *)theEvent{
  _point = [theEvent locationInWindow];
}

+ (NSPoint)mousePoint{
  return _point;
}

@end
