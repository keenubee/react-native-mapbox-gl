//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+React.h"

@interface UIColor (RCTAdditions)
+ (UIColor *)colorFromString:(NSString *)string;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end
