//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import "UIColor+RCTAdditions.h"


@implementation UIColor (RCTAdditions)

+ (UIColor *)colorWithString:(NSString *)string
{
    SEL colorLabel = NSSelectorFromString([string stringByAppendingString:@"Color"]);
    if ([UIColor respondsToSelector:colorLabel]) {
        return [UIColor performSelector:colorLabel];
    }
    if ([string rangeOfString:@"hsl"].location == 0) {
        return [UIColor colorWithHSLAString:string];
    }
    if ([string rangeOfString:@"rgb"].location == 0) {
        return [UIColor colorWithRGBAString:string];
    }
    return [UIColor colorWithHexString:string];
}

+ (UIColor *)colorWithRGBAString:(NSString *)rgbaString
{
    float red = 0;
    float green = 0;
    float blue = 0;
    float alpha = 1.0;

    NSScanner *scanner = [NSScanner scannerWithString:rgbaString];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];

    // Throw away characters before the first number
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&red];
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&green];
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&blue];
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&alpha];

    return [UIColor colorWithRed:red/255.0
                    green:green/255.0
                    blue:blue/255.0
                    alpha:alpha
    ];
}

+ (UIColor *)colorWithHSLAString:(NSString *)hslaString
{
    float hue = 0;
    float saturationL = 0;
    float lightness = 0;
    float alpha = 1.0;

    NSScanner *scanner = [NSScanner scannerWithString:hslaString];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];

    // Throw away characters before the first number
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&hue];
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&saturationL];
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&lightness];
    [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
    [scanner scanFloat:&alpha];

    // convert from HSL to HSB
    float lNormalized = lightness/100.0;
    float bNormalized = (2.0*lNormalized + (saturationL/100.0)*(1 - fabsf(2.0*lNormalized - 1)))/2.0;
    float saturationB = 2.0 * (bNormalized - lNormalized)/bNormalized;

    return [UIColor colorWithHue:hue/360.0
                    saturation:saturationB
                    brightness:bNormalized
                    alpha:alpha
    ];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    if ( [hexString rangeOfString:@"#"].location == 0 ) {
      [scanner setScanLocation:1]; // bypass '#' character
    }
    [scanner scanHexInt:&rgbValue];
    if ([hexString length] < 6) {
        // this is a shortcut code, need to double the characters
        return [UIColor colorWithRed:(((rgbValue & 0xF00) >> 8) + ((rgbValue & 0xF00) >> 4))/255.0
                        green:(((rgbValue & 0xF0) >> 4) + (rgbValue & 0xF0))/255.0
                        blue:((rgbValue & 0xF) + ((rgbValue & 0xF) << 4))/255.0
                        alpha:1.0
        ];
    }
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0
                    green:((rgbValue & 0xFF00) >> 8)/255.0
                    blue:(rgbValue & 0xFF)/255.0
                    alpha:1.0
    ];
}

@end
