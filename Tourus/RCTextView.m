//
//  RCTextView.m
//  RedditCollage
//
//  Created by Scott Andrus on 2/18/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "RCTextView.h"
#import "SAViewManipulator.h"

@implementation RCTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RCTextView" owner:self options:nil];
    self = [nib objectAtIndex:0];
    if (self) {
        // Initialization code
        [SAViewManipulator addBorderToView:self withWidth:.5 color:[UIColor darkGrayColor] andRadius:10];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [SAViewManipulator addBorderToView:self withWidth:.5 color:[UIColor darkGrayColor] andRadius:5];
    }
    return self;
}
//
//- (BOOL)resignFirstResponder {
//    [self.textField resignFirstResponder];
//    
//    return [super resignFirstResponder];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
