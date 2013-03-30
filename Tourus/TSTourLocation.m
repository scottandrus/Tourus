//
//  TSTourLocation.m
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSTourLocation.h"

@implementation TSTourLocation

- (id)init
{
    self = [super init];
    if (self) {
        self.loc = [CLLocation new];
        self.title = @"Location";
        self.locDescription = @"Location description...";
        self.videoLink = @"";
        self.photos = [NSArray array];
    }
    return self;
}

@end
