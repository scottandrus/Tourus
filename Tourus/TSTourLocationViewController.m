//
//  TSTourLocationViewController.m
//  Tourus
//
//  Created by Scott Andrus on 3/31/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSTourLocationViewController.h"

#import "TSAnnotation.h"

#import "SAViewManipulator.h"

@interface TSTourLocationViewController ()

@end

@implementation TSTourLocationViewController

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
    
    [self setupUserInterface];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Customization

- (void)setupUserInterface {
    
    // Title
    self.title = [NSString stringWithFormat:@"Location %d", [self.tour.tourLocations indexOfObject:self.thisLocation]+1];
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    [self.mapView setRegion:MKCoordinateRegionMake(self.thisLocation.loc.coordinate, MKCoordinateSpanMake(.005, .005)) animated:YES];
    
    TSAnnotation *annotation = [[TSAnnotation alloc] initWithTitle:self.thisLocation.title subtitle:nil andCoordinate:self.thisLocation.loc.coordinate];
    [self.mapView addAnnotation:annotation];
    
    if ([self.tour.tourLocations indexOfObject:self.thisLocation]+1 == self.tour.tourLocations.count) {
        self.navigationItem.rightBarButtonItem = nil;
        self.rightButton.hidden = YES;
    } else if (self.rightButton.hidden) self.rightButton.hidden = NO;
    
    if ([self.tour.tourLocations indexOfObject:self.thisLocation] == 0) {
        self.leftButton.hidden = YES;
    } else if (self.leftButton.hidden) self.leftButton.hidden = NO;
    
    [SAViewManipulator setGradientBackgroundImageForView:self.scrollViewBackground withTopColor:nil andBottomColor:nil];
    
    self.locationNameLabel.text = self.thisLocation.title;
    self.descriptionText.text = self.thisLocation.locDescription;
}

#pragma mark - Actions

- (IBAction)backPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)forwardPressed:(UIButton *)sender {
    if ([self.tour.tourLocations indexOfObject:self.thisLocation]+1 != self.tour.tourLocations.count) {
        [self performSegueWithIdentifier:@"next_location" sender:sender];
    }
}

- (IBAction)donePressed:(UIBarButtonItem *)sender {
    [self.navigationController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TSTourLocationViewController *tstlvc = (TSTourLocationViewController *)segue.destinationViewController;
    [tstlvc setThisLocation:[self.tour.tourLocations objectAtIndex:[self.tour.tourLocations indexOfObject:self.thisLocation]+1]];
    [tstlvc setTour:self.tour];
}

@end
