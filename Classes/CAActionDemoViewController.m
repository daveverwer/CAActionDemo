//
//  CAActionDemoViewController.m
//  CAActionDemo
//
//  Created by Dave Verwer on 08/08/2009.
//  Copyright Shiny Development Ltd. 2009. All rights reserved.
//

#import "CAActionDemoViewController.h"

@implementation CAActionDemoViewController

@synthesize imageLayer = _imageLayer;

- (void)loadView {
  [super loadView];
  
  CALayer *layer = [CALayer new];
  [layer setContents:(id)[[UIImage imageNamed:@"Image.png"] CGImage]];
  [layer setBounds:CGRectMake(0, 0, 320, 480)];
  [layer setPosition:CGPointMake(160, 240)];
  [layer setDelegate:self];
  [self setImageLayer:layer];
  [layer release]; layer = nil;
  
  [[[self view] layer] insertSublayer:[self imageLayer] atIndex:0];
}

- (void)viewDidUnload {
  [self setImageLayer:nil];
  [super viewDidUnload];
}

- (void)dealloc {
  [_imageLayer release];
  [super dealloc];
}

- (IBAction)hideLayer:(id)sender {
  [[self imageLayer] setHidden:YES];
}

- (id<CAAction>)actionForLayer:(CALayer*)layer forKey:(NSString*)key {
  if ([key isEqualToString:@"hidden"]) {
    NSLog(@"Info [%@ %s]: %@", [self class], _cmd, key);
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [scale setFromValue:[NSNumber numberWithFloat:1]];
    [scale setToValue:[NSNumber numberWithFloat:0]];
    [scale setDuration:2];
    [scale setDelegate:self];
    return scale;
  } else return [CALayer defaultActionForKey:key];
}

- (void)animationDidStart:(CAAnimation*)animation {
  NSLog(@"Info [%@ %s]", [self class], _cmd);
}

- (void)animationDidStop:(CAAnimation*)animation finished:(BOOL)flag {
  NSLog(@"Info [%@ %s]: %@", [self class], _cmd, flag ? @"Finished" : @"Did not finish");
}

@end
