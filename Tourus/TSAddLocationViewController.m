//
//  TSAddLocationViewController.m
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSAddLocationViewController.h"

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
    self.title = [NSString stringWithFormat:@"Location %d", self.tour.tourLocations.count+1];
    
    // Custom right bar-button item
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(donePressed)];

}

#pragma mark - Actions

- (void)donePressed {
    NSMutableArray *mutTours = [self.tsvc.tourList mutableCopy];
    [mutTours addObject:self.tour];
    self.tsvc.tourList = [mutTours copy];
    [self.navigationController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIStoryboardMethods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TSAddLocationViewController *tsalvc = segue.destinationViewController;
    NSMutableArray *mutLocs = [self.tour.tourLocations mutableCopy];
    [mutLocs addObject:self.tour];
    self.tour.tourLocations = [mutLocs copy];
    tsalvc.tour = self.tour;
    tsalvc.tsvc = self.tsvc;
}

@end
