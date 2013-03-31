//
//  TSViewController.m
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSViewController.h"

// Categories
#import "UIImage+Color.h"
#import "UIBarButtonItem+Custom.h"
#import "UIView+Frame.h"

// Utilities
#import "SAViewManipulator.h"

// View Controllers
#import "TSCreateTourViewController.h"

// Model Objects
#import "TSTour.h"
#import "TSTourLocation.h"
#import "TSAnnotation.h"

// Frameworks
#import <Parse/Parse.h>

// Macros
#define kAddTourSegue @"add_tour_segue"
#define kCellIdentifier @"cell_identifier"

@interface TSViewController ()

@end

@implementation TSViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.tourList = [NSArray array];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.tourList = [NSArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set up user interface
    [self setupDummyData];
    [self setupUserInterface];
    [self setupMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.toursTableView reloadData];
}

#pragma mark - Dummy Data

- (void)setupDummyData {
    NSMutableArray *mutTours = [self.tourList mutableCopy];
    
    NSMutableArray *mutLocs;
    
    TSTour *tourOne = [TSTour new];
    tourOne.markingLocation = [[CLLocation alloc] initWithLatitude:(36.145101) longitude:(-86.804609)];
    tourOne.tourName = @"Vanderbilt University";
    tourOne.tourDescription = @"University Campus Tour";
    tourOne.tourPhoto = [UIImage imageNamed:@"vanderbilt.jpg"];
    mutLocs = [tourOne.tourLocations mutableCopy];
    for (int i = 0; i < 5; i++) {
        TSTourLocation *loc = [TSTourLocation new];
        loc.title = @"A Location";
        loc.loc = [[CLLocation alloc] initWithLatitude:36.145101 longitude:-86.804609];
        NSMutableArray *mutablePhotos = [loc.photos mutableCopy];
        for (int j = 0; j < 3; j++) {
            UIImage *image = [UIImage imageNamed:@"vanderbilt.jpg"];
            [mutablePhotos addObject:image];
        }
        loc.photos = [mutablePhotos copy];
        [mutLocs addObject:loc];
    }
    tourOne.tourLocations = [mutLocs copy];
    [mutTours addObject:tourOne];
    
    TSTour *tourTwo = [TSTour new];
    tourTwo.markingLocation = [[CLLocation alloc] initWithLatitude:(36.146677) longitude:(-86.810338)];
    tourTwo.tourName = @"Centennial Park";
    tourTwo.tourDescription = @"Park Tour";
    tourTwo.tourPhoto = [UIImage imageNamed:@"parthenon.jpg"];
    mutLocs = [tourTwo.tourLocations mutableCopy];
    for (int i = 0; i < 5; i++) {
        TSTourLocation *loc = [TSTourLocation new];
        loc.title = @"A Location";
        loc.loc = [[CLLocation alloc] initWithLatitude:36.145101 longitude:-86.804609];
        NSMutableArray *mutablePhotos = [loc.photos mutableCopy];
        for (int j = 0; j < 3; j++) {
            UIImage *image = [UIImage imageNamed:@"vanderbilt.jpg"];
            [mutablePhotos addObject:image];
        }
        loc.photos = [mutablePhotos copy];
        [mutLocs addObject:loc];
    }
    tourTwo.tourLocations = [mutLocs copy];
    [mutTours addObject:tourTwo];
    
    TSTour *tourThree = [TSTour new];
    tourThree.markingLocation = [[CLLocation alloc] initWithLatitude:36.141765 longitude:-86.793398];
    tourThree.tourName = @"Music Row";
    tourThree.tourDescription = @"City Tour";
    tourThree.tourPhoto = [UIImage imageNamed:@"musicrow.jpg"];
    mutLocs = [tourTwo.tourLocations mutableCopy];
    for (int i = 0; i < 5; i++) {
        TSTourLocation *loc = [TSTourLocation new];
        loc.title = @"A Location";
        loc.loc = [[CLLocation alloc] initWithLatitude:36.145101 longitude:-86.804609];
        NSMutableArray *mutablePhotos = [loc.photos mutableCopy];
        for (int j = 0; j < 3; j++) {
            UIImage *image = [UIImage imageNamed:@"vanderbilt.jpg"];
            [mutablePhotos addObject:image];
        }
        loc.photos = [mutablePhotos copy];
        [mutLocs addObject:loc];
    }
    tourThree.tourLocations = [mutLocs copy];
    [mutTours addObject:tourThree];
    
    self.tourList = [mutTours copy];
}

#pragma mark - UI Customization

- (void)setupUserInterface {
    
    self.toursTableView.dataSource = self;
    
    // Add Nav Bar text
    [self.navigationController.navigationBar addSubview:
     [[UIImageView alloc] initWithImage:
      [UIImage imageNamed:@"TourusNavBarText"]]];
    
    // Custom right bar-button item
    self.navigationItem.rightBarButtonItem =
    [UIBarButtonItem barButtonWithImage:
     [UIImage imageNamed:@"TSPlusButton"]
                                  style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(addTourPressed)];
    
    // Custom left bar-button item
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem barButtonWithImage:
     [UIImage imageNamed:@"TSMenuButton"]
                                  style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(menuPressed)];
    
    // TableView
    self.toursTableView.delegate = self;
    self.previousSize = 0;
    
    if ([self.toursTableView respondsToSelector:@selector(registerClass:forCellReuseIdentifier:)]) {
        [self.toursTableView registerClass:[TSListCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    
    // MapView
    [SAViewManipulator addBorderToView:self.toursMapView withWidth:2 color:[UIColor lightGrayColor] andRadius:0];
    
}

#pragma mark - Map Methods

- (void)setupMap {
    self.toursMapView.userTrackingMode = MKUserTrackingModeFollow;
    [self.toursMapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(self.toursMapView.userLocation.location.coordinate.latitude, self.toursMapView.userLocation.location.coordinate.longitude), MKCoordinateSpanMake(.002, .002)) animated:YES];
    
    for (TSTour *tour in self.tourList) {
        TSAnnotation *annotation = [[TSAnnotation alloc] initWithTitle:tour.tourName subtitle:tour.tourDescription andCoordinate:tour.markingLocation.coordinate];
        [self.toursMapView addAnnotation:annotation];
        tour.annotation = annotation;
    }
}

#pragma mark - Actions

- (void)addTourPressed {
    [self performSegueWithIdentifier:kAddTourSegue sender:self];
}

- (void)menuPressed {
    if (!self.sVC.isOpen) {
        [self.sVC openSlider:YES completion:nil];
    } else [self.sVC closeSlider:YES completion:nil];
}

- (IBAction)trackPressed:(UIButton *)sender {
    if (self.toursMapView.userTrackingMode == MKUserTrackingModeNone) {
        [self.toursMapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
    else if (self.toursMapView.userTrackingMode == MKUserTrackingModeFollow) {
        [self.toursMapView setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
    }
    else if (self.toursMapView.userTrackingMode == MKUserTrackingModeFollowWithHeading) [self.toursMapView setUserTrackingMode:MKUserTrackingModeNone animated:YES];
}

#pragma mark - Utility methods


#pragma mark - UIStoryboardMethods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kAddTourSegue]) {
        TSCreateTourViewController *tsctvc = (TSCreateTourViewController *)[segue.destinationViewController topViewController];
        tsctvc.tsvc = self;
    }
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tourList.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Try to dequeue a reusable cell
    TSListCell *cell = (TSListCell *)[self.toursTableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    // Configure the cell...
    TSTour *aTour = [[self tourList] objectAtIndex:indexPath.row];
    cell.nameLabel.text = [aTour tourName];
    cell.categoryLabel.text = [aTour tourDescription];
//    cell.nameLabel.text = @"Blah";
//    cell.categoryLabel.text = @"Blah";
    
    if (indexPath.row % 2) {
        cell.cellBg.backgroundColor = [UIColor whiteColor];
    } else cell.cellBg.backgroundColor = [UIColor lightGrayColor];
    
    cell.delegate = self;
    
    return cell;
}

#pragma mark - UITableView Delegate

// custom view for header. will be adjusted to default or specified header height
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    VMDSectionHeaderView *sHV = [[VMDSectionHeaderView alloc] init];
//    sHV.headerLabel.text = [self tableView:tableView titleForHeaderInSection:section];
//    [SAViewManipulator addBorderToView:sHV withWidth:1 color:[UIColor lightGrayColor] andRadius:0];
//    return sHV;
//}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.toursTableView.contentOffset.y < 0) {
        CGFloat difference = self.previousSize - self.toursTableView.contentOffset.y;
        self.toursMapView.height += difference;
        self.previousSize = self.toursTableView.contentOffset.y;
    }
    else if (self.toursMapView.height != 152) {
        self.toursMapView.height = 152;
    }
} // any offset changes

#pragma mark - TSListCellDelegate

- (void)setWayPointToTour:(TSTour *)tour {
    [self.toursMapView selectAnnotation:tour.annotation animated:YES];
}

@end
