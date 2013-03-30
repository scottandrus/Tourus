//
//  TSCreateTourViewController.m
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSCreateTourViewController.h"

// Model Objects
#import "TSTour.h"

// View Controllers
#import "TSAddLocationViewController.h"

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
    
    self.descriptionTextView.delegate = self;
    
    // Custom left bar-button item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithImage:[UIImage imageNamed:@"TSBackButton"] style:UIBarButtonItemStylePlain target:self action:@selector(cancelPressed)];
}

#pragma mark - Actions

- (void)cancelPressed {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    self.lettersRemaining = 140 - textView.text.length;
    self.lettersRemainingLabel.text =
    [NSString stringWithFormat:@"%d", self.lettersRemaining];
}

#pragma mark - UIStoryboardMethods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TSAddLocationViewController *tsalvc = segue.destinationViewController;
    tsalvc.tour = [TSTour new];
    tsalvc.tour.tourName = self.nameTextField.text;
    tsalvc.tour.tourDescription = self.descriptionTextView.text;
    tsalvc.tsvc = self.tsvc;
}

@end
