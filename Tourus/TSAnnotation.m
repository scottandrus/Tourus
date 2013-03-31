//
//  TSAnnotation.m
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import "TSAnnotation.h"

@implementation TSAnnotation

- (id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle andCoordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        self.name = title;
        self.category = subtitle;
        self.coordinate = coordinate;
    }
    return self;
}


- (CLLocationCoordinate2D)coordinate;
{
    return _coordinate;
}

- (NSString *)title
{
    return _name;
}

// optional
- (NSString *)subtitle
{
    return _category;
}


@end

