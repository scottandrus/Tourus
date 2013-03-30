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

// Utilities
#import "SAViewManipulator.h"

// View Controllers
#import "TSCreateTourViewController.h"

// Model Objects
#import "TSTour.h"

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
    [self setupUserInterface];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    
    TSTour *aTour = [[self tourList] objectAtIndex:indexPath.row];
    cell.textLabel.text = [aTour tourName];
    
    return cell;
}

@end
