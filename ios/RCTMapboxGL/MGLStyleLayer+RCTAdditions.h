//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapbox/Mapbox.h>
#import "RCTMapboxGL.h"

@interface MGLStyleLayer (RCTAdditions)
+ (MGLStyleLayer *)styleLayerWithJson:(nonnull NSDictionary *)layerJson mapView:(RCTMapboxGL *)mapView;
- (NSPredicate *)predicateWithJson:(nonnull NSArray *)filter;
@end
