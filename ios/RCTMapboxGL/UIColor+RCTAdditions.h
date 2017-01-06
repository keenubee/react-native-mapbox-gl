//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import "UIView+React.h"

@interface UIColor (RCTAdditions)
+ (UIColor *)colorWithString:(NSString *)string;
+ (UIColor *)colorWithRGBAString:(NSString *)rgbaString;
+ (UIColor *)colorWithHSLAString:(NSString *)hslaString;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
@end
