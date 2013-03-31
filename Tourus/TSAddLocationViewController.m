//
//  TSAddLocationViewController.m
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSAddLocationViewController.h"

// Frameworks
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>

@interface TSAddLocationViewController ()

@end

@implementation TSAddLocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (!self.tour) {
        self.tour = [TSTour new];
    }
    if (!self.thisLocation) {
        self.thisLocation = [TSTourLocation new];
    }
    
    self.locManager = [CLLocationManager new];
    [self.locManager startUpdatingLocation];
    [self setupUserInterface];
    [self setupMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Customization

- (void)setupUserInterface {
    
    // Title
    self.title = [NSString stringWithFormat:@"Location %d", self.tour.tourLocations.count+1];
    
    // Custom right bar-button item
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(donePressed)];

}

#pragma mark - Map Management

- (void)setupMap {
    [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(self.locManager.location.coordinate.latitude, self.locManager.location.coordinate.longitude - .0036), MKCoordinateSpanMake(.005, .005)) animated:YES];
    self.mapView.userTrackingMode = MKUserTrackingModeNone;
}

#pragma mark - Actions

- (void)donePressed {
    PFObject *pfTour = [PFObject objectWithClassName:@"TSTour"];
    NSData *imageData = UIImagePNGRepresentation(self.tour.tourPhoto);
    PFFile *photoFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@_photo.png", self.tour.tourName] data:imageData];
    
    PFGeoPoint *markingPoint = [PFGeoPoint geoPointWithLocation:self.tour.markingLocation];
    
    PFUser *user = [PFUser currentUser];
    PFRelation *locationsRelation = [pfTour relationforKey:@"locations"];
    
    PFObject *pfTourLocation;
    for (TSTourLocation *location in self.tour.tourLocations) {
        pfTourLocation = [PFObject objectWithClassName:@"TSTourLocation"];
        
        [pfTourLocation setObject:[PFGeoPoint geoPointWithLocation:location.loc] forKey:@"loc"];
        [pfTourLocation setObject:location.title forKey:@"title"];
        [pfTourLocation setObject:location.locDescription forKey:@"locDescription"];
        [pfTourLocation setObject:location.videoLink forKey:@"videoLink"];
        PFRelation *photosRelation = [pfTourLocation relationforKey:@"photos"];
        int i = 0;
        for (UIImage *photo in location.photos) {
            i++;
            PFFile *locPhotoFile = [PFFile fileWithName:[NSString stringWithFormat:@"%@_locphoto_%d.png", self.tour.tourName, i] data:imageData];
            PFObject *photoObject = [PFObject objectWithClassName:@"TSLocationPhoto"];
            [photoObject setObject:locPhotoFile forKey:@"locPhotoFile"];
            [photosRelation addObject:photoObject];
        }
        [locationsRelation addObject:pfTourLocation];
    }
    
    [user saveInBackground];
    
    [pfTour setObject:self.tour.tourName forKey:@"tourName"];
    [pfTour setObject:self.tour.createdBy forKey:@"createdBy"];
    [pfTour setObject:photoFile forKey:@"tourPhoto"];
    [pfTour setObject:markingPoint forKey:@"markingLocation"];
    
    [pfTour save];
    
    [self.navigationController.presentingViewController dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)removeKeyboard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)removeCategoryKeyboard:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)cameraButton:(UIButton *)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera]) {
        // Create image picker controller
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        // Set source to the camera
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        // Delegate is self
        imagePicker.delegate = self;
        
        // Show image picker
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


#pragma mark - UIStoryboardMethods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.thisLocation.loc = self.locManager.location;
    [self.locManager stopUpdatingLocation];
    self.thisLocation.title = self.locationNameTextField.text;
    self.thisLocation.locDescription = self.categoryTextField.text;
    
    TSAddLocationViewController *tsalvc = segue.destinationViewController;
    NSMutableArray *mutLocs = [self.tour.tourLocations mutableCopy];
    [mutLocs addObject:self.tour];
    self.tour.tourLocations = [mutLocs copy];
    tsalvc.tour = self.tour;
    tsalvc.tsvc = self.tsvc;
}

#pragma mark - UIImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0) {
    
    // Dismiss controller
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // Add image;
    NSMutableArray *mutablePhotos = [self.thisLocation.photos mutableCopy];
    [mutablePhotos addObject:image];
    self.thisLocation.photos = [mutablePhotos copy];

}

@end
