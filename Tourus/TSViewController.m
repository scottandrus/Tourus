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

// Frameworks
#import <Parse/Parse.h>

// Macros
#define kAddTourSegue @"add_tour_segue"

@interface TSViewController ()

@end

@implementation TSViewController

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


#pragma mark - UI Customization

- (void)setupUserInterface {
    
    // Custom left bar-button item
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"13-plus" withColor:[UIColor whiteColor]] style:UIBarButtonItemStylePlain target:self action:@selector(addTourPressed)];
}

#pragma mark - Actions

- (void)addTourPressed {
    [self performSegueWithIdentifier:kAddTourSegue sender:self];
}

#pragma mark - UIStoryboardMethods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Nothing to do here
}

#pragma mark - TableViewDataSource

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    
//}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

@end
