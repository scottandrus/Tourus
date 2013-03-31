//
//  TSTourViewController.m
//  Tourus
//
//  Created by Scott Andrus on 3/31/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSTourViewController.h"

#import "TSTourLocationViewController.h"

@interface TSTourViewController ()

@end

@implementation TSTourViewController

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
    [self populateInterface];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - General

- (void)populateInterface {
    self.tourPhotoImageView.image = self.tour.tourPhoto;
    self.tourNameLabel.text = self.tour.tourName;
    self.tourCategoryLabel.text = self.tour.tourDescription;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TSTourLocationViewController *tstlvc = (TSTourLocationViewController *)[segue.destinationViewController topViewController];
    [tstlvc setThisLocation:[self.tour.tourLocations objectAtIndex:0]];
    [tstlvc setTour:self.tour];
}

@end
