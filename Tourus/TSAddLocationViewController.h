//
//  TSAddLocationViewController.h
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

// Model objects
#import "TSTour.h"
#import "TSTourLocation.h"

// View Controllers
#import "TSViewController.h"

@interface TSAddLocationViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate>

@property (strong, nonatomic) TSTour *tour;
@property (strong, nonatomic) TSTourLocation *thisLocation;
@property (strong, nonatomic) TSViewController *tsvc;
@property (strong, nonatomic) CLLocationManager *locManager;

// IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *lettersRemainingLabel;
@property (assign, nonatomic) NSInteger lettersRemaining;
@property (strong, nonatomic) IBOutlet UITextField *locationNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *categoryTextField;
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
