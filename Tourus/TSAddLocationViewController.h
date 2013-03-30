//
//  TSAddLocationViewController.h
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

// Model objects
#import "TSTour.h"
#import "TSTourLocation.h"

// View Controllers
#import "TSViewController.h"

@interface TSAddLocationViewController : UIViewController

@property (strong, nonatomic) TSTour *tour;
@property (strong, nonatomic) TSTourLocation *thisLocation;
@property (strong, nonatomic) TSViewController *tsvc;

@end
