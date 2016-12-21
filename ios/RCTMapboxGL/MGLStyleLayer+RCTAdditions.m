//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import "MGLStyleLayer+RCTAdditions.h"


@implementation MGLStyleLayer (RCTAdditions)

+ (MGLStyleLayer *)fromJson:(nonnull NSDictionary *)layerJson
{
    return [[MGLStyleLayer alloc] initWithIdentifier:@"test"];
}

@end
