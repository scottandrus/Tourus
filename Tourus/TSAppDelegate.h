//
//  TSAppDelegate.h
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

// Utilities
#import "JSSlidingViewController.h"
#import "TSMenuViewController.h"

@interface TSAppDelegate : UIResponder <UIApplicationDelegate, JSSlidingViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JSSlidingViewController *viewController;

@property (strong, nonatomic) TSMenuViewController *backVC;
@property (strong, nonatomic) UINavigationController *frontVC;

@end
