//
//  TSTour.m
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSTour.h"

@implementation TSTour

- (id)init
{
    self = [super init];
    if (self) {
        self.tourName = @"A Tour";
        self.createdBy = @"First Last";
        self.tourPhoto = [UIImage imageNamed:@"TourusNavBarBG"];
        self.markingLocation = [CLLocation new];
        self.tourLocations = [NSArray array];
    }
    return self;
}

@end
