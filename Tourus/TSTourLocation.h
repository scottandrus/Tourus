//
//  TSTourLocation.h
//  Tourus
//
//  Created by Scott Andrus on 3/30/13.
//  Copyright (c) 2013 Tapatory, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TSTourLocation : NSObject

@property CLLocation *loc;
@property NSString *title;
@property NSString *locDescription;
@property NSString *videoLink;
@property NSArray *photos;

@end
