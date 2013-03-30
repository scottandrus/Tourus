//
//  TSTour.h
//  Tourus
//
//  Created by Scott Andrus on 3/29/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TSTour : NSObject

@property NSString *tourName;
@property NSString *createdBy;
@property NSInteger viewCount;
@property UIImage *tourPhoto;
@property CLLocation *markingLocation;
@property NSArray *tourLocations;

@end
