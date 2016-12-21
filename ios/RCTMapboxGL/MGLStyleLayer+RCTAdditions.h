//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapbox/Mapbox.h>

@interface MGLStyleLayer (RCTAdditions)
+ (MGLStyleLayer *)fromJson:(nonnull NSDictionary *)layerJson;
@end
