//
//  TSTourViewController.h
//  Tourus
//
//  Created by Scott Andrus on 3/31/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

// Model Objects
#import "TSTour.h"

@interface TSTourViewController : UIViewController

@property (strong, nonatomic) TSTour *tour;

@property (strong, nonatomic) IBOutlet UIImageView *tourPhotoImageView;
@property (strong, nonatomic) IBOutlet UILabel *tourNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *tourCategoryLabel;

@end
