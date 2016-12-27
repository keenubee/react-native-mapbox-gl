//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import "UIColor+RCTAdditions.h"


@implementation UIColor (RCTAdditions)

+ (UIColor *)colorFromString:(NSString *)string
{
    SEL colorLabel = NSSelectorFromString([string stringByAppendingString:@"Color"]);
    if ([UIColor respondsToSelector:colorLabel]) {
        return [UIColor performSelector:colorLabel];
    }
    return [UIColor colorFromHexString:string];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    if ( [hexString rangeOfString:@"#"].location == 0 ) {
      [scanner setScanLocation:1]; // bypass '#' character
    }
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0
                    green:((rgbValue & 0xFF00) >> 8)/255.0
                    blue:(rgbValue & 0xFF)/255.0
                    alpha:1.0
    ];
}

@end
