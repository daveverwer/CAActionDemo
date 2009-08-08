//
//  CAActionDemoViewController.h
//  CAActionDemo
//
//  Created by Dave Verwer on 08/08/2009.
//  Copyright Shiny Development Ltd. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAActionDemoViewController : UIViewController {
  CALayer *_imageLayer;
}

@property (nonatomic,retain) CALayer *imageLayer;

- (IBAction)removeLayer:(id)sender;

@end

