//
//  TSTourLocationViewController.h
//  Tourus
//
//  Created by Scott Andrus on 3/31/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "TSTour.h"
#import "TSTourLocation.h"

@interface TSTourLocationViewController : UIViewController

@property (strong, nonatomic) TSTour *tour;
@property (strong, nonatomic) TSTourLocation *thisLocation;
@property (strong, nonatomic) CLLocationManager *locManager;

@property (strong, nonatomic) IBOutlet UIScrollView *photosScrollView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIView *scrollViewBackground;
@property (strong, nonatomic) IBOutlet UITextView *descriptionText;
@property (strong, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;

@end
