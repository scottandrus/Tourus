//
//  TSTour.h
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "TSAnnotation.h"

@interface TSTour : NSObject

@property (strong, nonatomic) NSString *tourName;
@property (strong, nonatomic) NSString *createdBy;
@property (strong, nonatomic) NSString *tourDescription;
@property (assign, nonatomic) NSInteger viewCount;
@property (strong, nonatomic) UIImage *tourPhoto;
@property (strong, nonatomic) CLLocation *markingLocation;
@property (strong, nonatomic) NSArray *tourLocations;
@property (strong, nonatomic) TSAnnotation *annotation;

@end
