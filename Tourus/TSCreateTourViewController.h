//
//  TSCreateTourViewController.h
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSViewController.h"

@interface TSCreateTourViewController : UIViewController <UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (strong, nonatomic) NSArray *tourList;
@property (strong, nonatomic) TSViewController *tsvc;
@property (strong, nonatomic) CLLocationManager *locManager;

@property (strong, nonatomic) IBOutlet UITextField *descriptionTextView;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
