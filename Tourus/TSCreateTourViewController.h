//
//  TSCreateTourViewController.h
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSViewController.h"

@interface TSCreateTourViewController : UIViewController <UITextViewDelegate>

@property (assign, nonatomic) NSInteger lettersRemaining;
@property (strong, nonatomic) NSArray *tourList;
@property (strong, nonatomic) TSViewController *tsvc;

// IBOutlets
@property (strong, nonatomic) IBOutlet UILabel *lettersRemainingLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@end
