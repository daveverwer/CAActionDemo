//
//  CAActionDemoAppDelegate.h
//  CAActionDemo
//
//  Created by Dave Verwer on 08/08/2009.
//  Copyright Shiny Development Ltd. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CAActionDemoViewController;

@interface CAActionDemoAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window;
  CAActionDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CAActionDemoViewController *viewController;

@end

