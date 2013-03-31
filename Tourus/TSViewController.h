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

// Views
#import "TSListCell.h"

@interface TSViewController : UIViewController <MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, TSListCellDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *toursMapView;
@property (strong, nonatomic) IBOutlet UITableView *toursTableView;

@property (strong, nonatomic) JSSlidingViewController *sVC;
@property (strong, nonatomic) UIImageView *navBarText;

@property BOOL shouldZoomMap;
@property CGFloat previousSize;

// Data source
@property (strong, nonatomic) NSArray *tourList;

@end
