//
//  TSCreateTourViewController.m
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSCreateTourViewController.h"

// Categories
#import "UIImage+Color.h"
#import "UIBarButtonItem+Custom.h"

@interface TSCreateTourViewController ()

@end

@implementation TSCreateTourViewController

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
    
    // Set up interface
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
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"05-arrow-west" withColor:[UIColor whiteColor]] style:UIBarButtonItemStylePlain target:self action:@selector(cancelPressed)];
}

#pragma mark - Actions

- (void)cancelPressed {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
