//
//  CAActionDemoLayer.m
//  CAActionDemo
//
//  Created by Dave Verwer on 08/08/2009.
//  Copyright 2009 Shiny Development Ltd.. All rights reserved.
//

#import "CAActionDemoLayer.h"

@implementation CAActionDemoLayer

- (id<CAAction>)actionForKey:(NSString*)key {
  if ([key isEqualToString:@"onOrderIn"]) {
    NSLog(@"Info [%@ %s]: %@", [self class], _cmd, key);
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [scale setFromValue:[NSNumber numberWithFloat:0]];
    [scale setDuration:1];
    [scale setDelegate:self];
    return scale;
  } else if ([key isEqualToString:@"onOrderOut"]) {
    NSLog(@"Info [%@ %s]: %@", [self class], _cmd, key);
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [scale setToValue:[NSNumber numberWithFloat:0]];
    [scale setDuration:1];
    [scale setDelegate:self];
    return scale;
  } else return [super actionForKey:key];
}

- (void)animationDidStart:(CAAnimation*)animation {
  NSLog(@"Info [%@ %s]", [self class], _cmd);
}

- (void)animationDidStop:(CAAnimation*)animation finished:(BOOL)flag {
  NSLog(@"Info [%@ %s]", [self class], _cmd);
}

@end