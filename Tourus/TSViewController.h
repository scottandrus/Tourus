//
//  TSViewController.h
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

// Utilities
#import "JSSlidingViewController.h"

@interface TSViewController : UIViewController <MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet MKMapView *toursMapView;
@property (strong, nonatomic) IBOutlet UITableView *toursTableView;

@property (strong, nonatomic) JSSlidingViewController *sVC;

// Data source
@property (strong, nonatomic) NSArray *tourList;

@end
