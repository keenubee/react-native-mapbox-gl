//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapbox/Mapbox.h>
#import "RCTMapboxGL.h"

@interface MGLStyleLayer (RCTAdditions)
+ (MGLStyleLayer *)fromJson:(nonnull NSDictionary *)layerJson withMap:(RCTMapboxGL *)mapView;
- (NSPredicate *)predicateFromJson:(nonnull NSArray *)filter;
@end
