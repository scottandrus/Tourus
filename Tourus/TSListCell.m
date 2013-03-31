//
//  TSListCell.m
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSListCell.h"
#import "TSViewController.h"

@implementation TSListCell

@synthesize nameLabel, categoryLabel, goToButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    // Initialization code
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TSListCell" owner:self options:nil];
    self = [nib objectAtIndex:0];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.goToButton.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)goToPressed:(UIButton *)sender {
    
    if ([self.delegate isKindOfClass:[TSViewController class]]) {
        TSViewController *tsvc = (TSViewController *)self.delegate;
        NSIndexPath *indexPath = [[tsvc toursTableView] indexPathForCell:self];
        [self.delegate setWayPointToTour:[tsvc.tourList objectAtIndex:indexPath.row]];
    }
}

@end
