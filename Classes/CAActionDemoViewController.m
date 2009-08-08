//
//  CAActionDemoViewController.m
//  CAActionDemo
//
//  Created by Dave Verwer on 08/08/2009.
//  Copyright Shiny Development Ltd. 2009. All rights reserved.
//

#import "CAActionDemoViewController.h"
#import "CAActionDemoLayer.h"

@implementation CAActionDemoViewController

@synthesize imageLayer = _imageLayer;

- (void)loadView {
  [super loadView];
  
  CALayer *layer = [CAActionDemoLayer new];
  [layer setContents:(id)[[UIImage imageNamed:@"Image.png"] CGImage]];
  [layer setBounds:CGRectMake(0, 0, 320, 480)];
  [layer setPosition:CGPointMake(160, 240)];
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

- (IBAction)removeLayer:(id)sender {
  [[self imageLayer] removeFromSuperlayer];
}
@end
