//
//  TSListCell.h
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

// Model Objects
#import "TSTour.h"

@protocol TSListCellDelegate <NSObject>

@required

- (void)setWayPointToTour:(TSTour *)tour;

@end

@interface TSListCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel;
@property (nonatomic, weak) IBOutlet UIButton *goToButton;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (nonatomic, weak) IBOutlet UIView *cellBg;

@property (strong, nonatomic) id<TSListCellDelegate> delegate;

@end
