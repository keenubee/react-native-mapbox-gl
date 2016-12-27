//
// Copyright (c) 2016 Mapbox. All rights reserved.
//
// This file is generated. See scripts/generate-layer-factory.js

#import "MGLStyleLayer+RCTAdditions.h"
#import "UIColor+RCTAdditions.h"
#import <CoreGraphics/CGGeometry.h>


@implementation MGLStyleLayer (RCTAdditions)

+ (MGLStyleLayer *)fromJson:(nonnull NSDictionary *)layerJson
                   withMap:(RCTMapboxGL *)mapView
{
    NSString *idString = layerJson[@"id"];
    NSString *typeString = layerJson[@"type"];
    // if (!idString || !typeString) {
    //     return;
    // }
    if([typeString isEqualToString:@"fill"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLFillStyleLayer *layer = [[MGLFillStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([paintProperties valueForKey:@"fill-antialias"]) {
            if ([[paintProperties valueForKey:@"fill-antialias"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-antialias"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *fillAntialiasValue;
                NSNumber *baseNumber = paintProperties[@"fill-antialias"][@"base"];
                if (baseNumber) {
                    fillAntialiasValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    fillAntialiasValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setFillAntialiased:fillAntialiasValue];
            } else {
                MGLStyleValue *fillAntialiasValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-antialias"]];
                [layer setFillAntialiased:fillAntialiasValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-opacity"]) {
            if ([[paintProperties valueForKey:@"fill-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *fillOpacityValue;
                NSNumber *baseNumber = paintProperties[@"fill-opacity"][@"base"];
                if (baseNumber) {
                    fillOpacityValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    fillOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setFillOpacity:fillOpacityValue];
            } else {
                MGLStyleValue *fillOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-opacity"]];
                [layer setFillOpacity:fillOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-color"]) {
            if ([[paintProperties valueForKey:@"fill-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *fillColorValue;
                NSNumber *baseNumber = paintProperties[@"fill-color"][@"base"];
                if (baseNumber) {
                    fillColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    fillColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setFillColor:fillColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"fill-color"]];
                MGLStyleValue *fillColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setFillColor:fillColorValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-outline-color"]) {
            if ([[paintProperties valueForKey:@"fill-outline-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-outline-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *fillOutlineColorValue;
                NSNumber *baseNumber = paintProperties[@"fill-outline-color"][@"base"];
                if (baseNumber) {
                    fillOutlineColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    fillOutlineColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setFillOutlineColor:fillOutlineColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"fill-outline-color"]];
                MGLStyleValue *fillOutlineColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setFillOutlineColor:fillOutlineColorValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-translate"]) {
            if ([[paintProperties valueForKey:@"fill-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *fillTranslateValue;
                NSNumber *baseNumber = paintProperties[@"fill-translate"][@"base"];
                if (baseNumber) {
                    fillTranslateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    fillTranslateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setFillTranslate:fillTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"fill-translate"][0] floatValue], [paintProperties[@"fill-translate"][1] floatValue]);
                MGLStyleValue *fillTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setFillTranslate:fillTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-translate-anchor"]) {
            if ([[paintProperties valueForKey:@"fill-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *fillTranslateAnchorValue;
                NSNumber *baseNumber = paintProperties[@"fill-translate-anchor"][@"base"];
                if (baseNumber) {
                    fillTranslateAnchorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    fillTranslateAnchorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setFillTranslateAnchor:fillTranslateAnchorValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"fill-translate-anchor"][0] floatValue], [paintProperties[@"fill-translate-anchor"][1] floatValue]);
                MGLStyleValue *fillTranslateAnchorValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setFillTranslateAnchor:fillTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-pattern"]) {
            if ([[paintProperties valueForKey:@"fill-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *fillPatternValue;
                NSNumber *baseNumber = paintProperties[@"fill-pattern"][@"base"];
                if (baseNumber) {
                    fillPatternValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    fillPatternValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setFillPattern:fillPatternValue];
            } else {
                MGLStyleValue *fillPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-pattern"]];
                [layer setFillPattern:fillPatternValue];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];

        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateFromJson:filter]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"line"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSDictionary *layoutProperties = layerJson[@"layout"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLLineStyleLayer *layer = [[MGLLineStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([layoutProperties valueForKey:@"line-cap"]) {
            if ([[layoutProperties valueForKey:@"line-cap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-cap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineCapValue;
                NSNumber *baseNumber = layoutProperties[@"line-cap"][@"base"];
                if (baseNumber) {
                    lineCapValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineCapValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineCap:lineCapValue];
            } else {
                MGLStyleValue *lineCapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-cap"]];
                [layer setLineCap:lineCapValue];
            }
        }
        if ([layoutProperties valueForKey:@"line-join"]) {
            if ([[layoutProperties valueForKey:@"line-join"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-join"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineJoinValue;
                NSNumber *baseNumber = layoutProperties[@"line-join"][@"base"];
                if (baseNumber) {
                    lineJoinValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineJoinValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineJoin:lineJoinValue];
            } else {
                MGLStyleValue *lineJoinValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-join"]];
                [layer setLineJoin:lineJoinValue];
            }
        }
        if ([layoutProperties valueForKey:@"line-miter-limit"]) {
            if ([[layoutProperties valueForKey:@"line-miter-limit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-miter-limit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineMiterLimitValue;
                NSNumber *baseNumber = layoutProperties[@"line-miter-limit"][@"base"];
                if (baseNumber) {
                    lineMiterLimitValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineMiterLimitValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineMiterLimit:lineMiterLimitValue];
            } else {
                MGLStyleValue *lineMiterLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-miter-limit"]];
                [layer setLineMiterLimit:lineMiterLimitValue];
            }
        }
        if ([layoutProperties valueForKey:@"line-round-limit"]) {
            if ([[layoutProperties valueForKey:@"line-round-limit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-round-limit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineRoundLimitValue;
                NSNumber *baseNumber = layoutProperties[@"line-round-limit"][@"base"];
                if (baseNumber) {
                    lineRoundLimitValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineRoundLimitValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineRoundLimit:lineRoundLimitValue];
            } else {
                MGLStyleValue *lineRoundLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-round-limit"]];
                [layer setLineRoundLimit:lineRoundLimitValue];
            }
        }
        if ([paintProperties valueForKey:@"line-opacity"]) {
            if ([[paintProperties valueForKey:@"line-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineOpacityValue;
                NSNumber *baseNumber = paintProperties[@"line-opacity"][@"base"];
                if (baseNumber) {
                    lineOpacityValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineOpacity:lineOpacityValue];
            } else {
                MGLStyleValue *lineOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-opacity"]];
                [layer setLineOpacity:lineOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"line-color"]) {
            if ([[paintProperties valueForKey:@"line-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *lineColorValue;
                NSNumber *baseNumber = paintProperties[@"line-color"][@"base"];
                if (baseNumber) {
                    lineColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineColor:lineColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"line-color"]];
                MGLStyleValue *lineColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setLineColor:lineColorValue];
            }
        }
        if ([paintProperties valueForKey:@"line-translate"]) {
            if ([[paintProperties valueForKey:@"line-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *lineTranslateValue;
                NSNumber *baseNumber = paintProperties[@"line-translate"][@"base"];
                if (baseNumber) {
                    lineTranslateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineTranslateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineTranslate:lineTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"line-translate"][0] floatValue], [paintProperties[@"line-translate"][1] floatValue]);
                MGLStyleValue *lineTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setLineTranslate:lineTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"line-translate-anchor"]) {
            if ([[paintProperties valueForKey:@"line-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *lineTranslateAnchorValue;
                NSNumber *baseNumber = paintProperties[@"line-translate-anchor"][@"base"];
                if (baseNumber) {
                    lineTranslateAnchorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineTranslateAnchorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineTranslateAnchor:lineTranslateAnchorValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"line-translate-anchor"][0] floatValue], [paintProperties[@"line-translate-anchor"][1] floatValue]);
                MGLStyleValue *lineTranslateAnchorValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setLineTranslateAnchor:lineTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"line-width"]) {
            if ([[paintProperties valueForKey:@"line-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineWidthValue;
                NSNumber *baseNumber = paintProperties[@"line-width"][@"base"];
                if (baseNumber) {
                    lineWidthValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineWidthValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineWidth:lineWidthValue];
            } else {
                MGLStyleValue *lineWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-width"]];
                [layer setLineWidth:lineWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"line-gap-width"]) {
            if ([[paintProperties valueForKey:@"line-gap-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-gap-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineGapWidthValue;
                NSNumber *baseNumber = paintProperties[@"line-gap-width"][@"base"];
                if (baseNumber) {
                    lineGapWidthValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineGapWidthValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineGapWidth:lineGapWidthValue];
            } else {
                MGLStyleValue *lineGapWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-gap-width"]];
                [layer setLineGapWidth:lineGapWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"line-offset"]) {
            if ([[paintProperties valueForKey:@"line-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *lineOffsetValue;
                NSNumber *baseNumber = paintProperties[@"line-offset"][@"base"];
                if (baseNumber) {
                    lineOffsetValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineOffsetValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineOffset:lineOffsetValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"line-offset"][0] floatValue], [paintProperties[@"line-offset"][1] floatValue]);
                MGLStyleValue *lineOffsetValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setLineOffset:lineOffsetValue];
            }
        }
        if ([paintProperties valueForKey:@"line-blur"]) {
            if ([[paintProperties valueForKey:@"line-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineBlurValue;
                NSNumber *baseNumber = paintProperties[@"line-blur"][@"base"];
                if (baseNumber) {
                    lineBlurValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineBlurValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineBlur:lineBlurValue];
            } else {
                MGLStyleValue *lineBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-blur"]];
                [layer setLineBlur:lineBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"line-dasharray"]) {
            if ([[paintProperties valueForKey:@"line-dasharray"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-dasharray"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineDasharrayValue;
                NSNumber *baseNumber = paintProperties[@"line-dasharray"][@"base"];
                if (baseNumber) {
                    lineDasharrayValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    lineDasharrayValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLineDashPattern:lineDasharrayValue];
            } else {
                MGLStyleValue *lineDasharrayValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-dasharray"]];
                [layer setLineDashPattern:lineDasharrayValue];
            }
        }
        if ([paintProperties valueForKey:@"line-pattern"]) {
            if ([[paintProperties valueForKey:@"line-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *linePatternValue;
                NSNumber *baseNumber = paintProperties[@"line-pattern"][@"base"];
                if (baseNumber) {
                    linePatternValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    linePatternValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setLinePattern:linePatternValue];
            } else {
                MGLStyleValue *linePatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-pattern"]];
                [layer setLinePattern:linePatternValue];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];

        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateFromJson:filter]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"symbol"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSDictionary *layoutProperties = layerJson[@"layout"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLSymbolStyleLayer *layer = [[MGLSymbolStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([layoutProperties valueForKey:@"symbol-placement"]) {
            if ([[layoutProperties valueForKey:@"symbol-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *symbolPlacementValue;
                NSNumber *baseNumber = layoutProperties[@"symbol-placement"][@"base"];
                if (baseNumber) {
                    symbolPlacementValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    symbolPlacementValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setSymbolPlacement:symbolPlacementValue];
            } else {
                MGLStyleValue *symbolPlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-placement"]];
                [layer setSymbolPlacement:symbolPlacementValue];
            }
        }
        if ([layoutProperties valueForKey:@"symbol-spacing"]) {
            if ([[layoutProperties valueForKey:@"symbol-spacing"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-spacing"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *symbolSpacingValue;
                NSNumber *baseNumber = layoutProperties[@"symbol-spacing"][@"base"];
                if (baseNumber) {
                    symbolSpacingValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    symbolSpacingValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setSymbolSpacing:symbolSpacingValue];
            } else {
                MGLStyleValue *symbolSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-spacing"]];
                [layer setSymbolSpacing:symbolSpacingValue];
            }
        }
        if ([layoutProperties valueForKey:@"symbol-avoid-edges"]) {
            if ([[layoutProperties valueForKey:@"symbol-avoid-edges"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-avoid-edges"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *symbolAvoidEdgesValue;
                NSNumber *baseNumber = layoutProperties[@"symbol-avoid-edges"][@"base"];
                if (baseNumber) {
                    symbolAvoidEdgesValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    symbolAvoidEdgesValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setSymbolAvoidsEdges:symbolAvoidEdgesValue];
            } else {
                MGLStyleValue *symbolAvoidEdgesValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-avoid-edges"]];
                [layer setSymbolAvoidsEdges:symbolAvoidEdgesValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-allow-overlap"]) {
            if ([[layoutProperties valueForKey:@"icon-allow-overlap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-allow-overlap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconAllowOverlapValue;
                NSNumber *baseNumber = layoutProperties[@"icon-allow-overlap"][@"base"];
                if (baseNumber) {
                    iconAllowOverlapValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconAllowOverlapValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconAllowsOverlap:iconAllowOverlapValue];
            } else {
                MGLStyleValue *iconAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-allow-overlap"]];
                [layer setIconAllowsOverlap:iconAllowOverlapValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-ignore-placement"]) {
            if ([[layoutProperties valueForKey:@"icon-ignore-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-ignore-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconIgnorePlacementValue;
                NSNumber *baseNumber = layoutProperties[@"icon-ignore-placement"][@"base"];
                if (baseNumber) {
                    iconIgnorePlacementValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconIgnorePlacementValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconIgnoresPlacement:iconIgnorePlacementValue];
            } else {
                MGLStyleValue *iconIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-ignore-placement"]];
                [layer setIconIgnoresPlacement:iconIgnorePlacementValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-optional"]) {
            if ([[layoutProperties valueForKey:@"icon-optional"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-optional"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconOptionalValue;
                NSNumber *baseNumber = layoutProperties[@"icon-optional"][@"base"];
                if (baseNumber) {
                    iconOptionalValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconOptionalValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconOptional:iconOptionalValue];
            } else {
                MGLStyleValue *iconOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-optional"]];
                [layer setIconOptional:iconOptionalValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-rotation-alignment"]) {
            if ([[layoutProperties valueForKey:@"icon-rotation-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-rotation-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconRotationAlignmentValue;
                NSNumber *baseNumber = layoutProperties[@"icon-rotation-alignment"][@"base"];
                if (baseNumber) {
                    iconRotationAlignmentValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconRotationAlignmentValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconRotationAlignment:iconRotationAlignmentValue];
            } else {
                MGLStyleValue *iconRotationAlignmentValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-rotation-alignment"]];
                [layer setIconRotationAlignment:iconRotationAlignmentValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-size"]) {
            if ([[layoutProperties valueForKey:@"icon-size"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-size"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconSizeValue;
                NSNumber *baseNumber = layoutProperties[@"icon-size"][@"base"];
                if (baseNumber) {
                    iconSizeValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconSizeValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconScale:iconSizeValue];
            } else {
                MGLStyleValue *iconSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-size"]];
                [layer setIconScale:iconSizeValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-text-fit"]) {
            if ([[layoutProperties valueForKey:@"icon-text-fit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-text-fit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconTextFitValue;
                NSNumber *baseNumber = layoutProperties[@"icon-text-fit"][@"base"];
                if (baseNumber) {
                    iconTextFitValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconTextFitValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconTextFit:iconTextFitValue];
            } else {
                MGLStyleValue *iconTextFitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-text-fit"]];
                [layer setIconTextFit:iconTextFitValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-text-fit-padding"]) {
            if ([[layoutProperties valueForKey:@"icon-text-fit-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-text-fit-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconTextFitPaddingValue;
                NSNumber *baseNumber = layoutProperties[@"icon-text-fit-padding"][@"base"];
                if (baseNumber) {
                    iconTextFitPaddingValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconTextFitPaddingValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconTextFitPadding:iconTextFitPaddingValue];
            } else {
                MGLStyleValue *iconTextFitPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-text-fit-padding"]];
                [layer setIconTextFitPadding:iconTextFitPaddingValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-image"]) {
            if ([[layoutProperties valueForKey:@"icon-image"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-image"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconImageValue;
                NSNumber *baseNumber = layoutProperties[@"icon-image"][@"base"];
                if (baseNumber) {
                    iconImageValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconImageValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconImageName:iconImageValue];
            } else {
                MGLStyleValue *iconImageValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-image"]];
                [layer setIconImageName:iconImageValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-rotate"]) {
            if ([[layoutProperties valueForKey:@"icon-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconRotateValue;
                NSNumber *baseNumber = layoutProperties[@"icon-rotate"][@"base"];
                if (baseNumber) {
                    iconRotateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconRotateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconRotation:iconRotateValue];
            } else {
                MGLStyleValue *iconRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-rotate"]];
                [layer setIconRotation:iconRotateValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-padding"]) {
            if ([[layoutProperties valueForKey:@"icon-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconPaddingValue;
                NSNumber *baseNumber = layoutProperties[@"icon-padding"][@"base"];
                if (baseNumber) {
                    iconPaddingValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconPaddingValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconPadding:iconPaddingValue];
            } else {
                MGLStyleValue *iconPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-padding"]];
                [layer setIconPadding:iconPaddingValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-keep-upright"]) {
            if ([[layoutProperties valueForKey:@"icon-keep-upright"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-keep-upright"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconKeepUprightValue;
                NSNumber *baseNumber = layoutProperties[@"icon-keep-upright"][@"base"];
                if (baseNumber) {
                    iconKeepUprightValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconKeepUprightValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setKeepsIconUpright:iconKeepUprightValue];
            } else {
                MGLStyleValue *iconKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-keep-upright"]];
                [layer setKeepsIconUpright:iconKeepUprightValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-offset"]) {
            if ([[layoutProperties valueForKey:@"icon-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *iconOffsetValue;
                NSNumber *baseNumber = layoutProperties[@"icon-offset"][@"base"];
                if (baseNumber) {
                    iconOffsetValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconOffsetValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconOffset:iconOffsetValue];
            } else {
                CGVector vector = CGVectorMake([layoutProperties[@"icon-offset"][0] floatValue], [layoutProperties[@"icon-offset"][1] floatValue]);
                MGLStyleValue *iconOffsetValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setIconOffset:iconOffsetValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-pitch-alignment"]) {
            if ([[layoutProperties valueForKey:@"text-pitch-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-pitch-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textPitchAlignmentValue;
                NSNumber *baseNumber = layoutProperties[@"text-pitch-alignment"][@"base"];
                if (baseNumber) {
                    textPitchAlignmentValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textPitchAlignmentValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextPitchAlignment:textPitchAlignmentValue];
            } else {
                MGLStyleValue *textPitchAlignmentValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-pitch-alignment"]];
                [layer setTextPitchAlignment:textPitchAlignmentValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-rotation-alignment"]) {
            if ([[layoutProperties valueForKey:@"text-rotation-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-rotation-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textRotationAlignmentValue;
                NSNumber *baseNumber = layoutProperties[@"text-rotation-alignment"][@"base"];
                if (baseNumber) {
                    textRotationAlignmentValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textRotationAlignmentValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextRotationAlignment:textRotationAlignmentValue];
            } else {
                MGLStyleValue *textRotationAlignmentValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-rotation-alignment"]];
                [layer setTextRotationAlignment:textRotationAlignmentValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-field"]) {
            if ([[layoutProperties valueForKey:@"text-field"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-field"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textFieldValue;
                NSNumber *baseNumber = layoutProperties[@"text-field"][@"base"];
                if (baseNumber) {
                    textFieldValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textFieldValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextField:textFieldValue];
            } else {
                MGLStyleValue *textFieldValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-field"]];
                [layer setTextField:textFieldValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-font"]) {
            if ([[layoutProperties valueForKey:@"text-font"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-font"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textFontValue;
                NSNumber *baseNumber = layoutProperties[@"text-font"][@"base"];
                if (baseNumber) {
                    textFontValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textFontValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextFont:textFontValue];
            } else {
                MGLStyleValue *textFontValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-font"]];
                [layer setTextFont:textFontValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-size"]) {
            if ([[layoutProperties valueForKey:@"text-size"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-size"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textSizeValue;
                NSNumber *baseNumber = layoutProperties[@"text-size"][@"base"];
                if (baseNumber) {
                    textSizeValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textSizeValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextSize:textSizeValue];
            } else {
                MGLStyleValue *textSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-size"]];
                [layer setTextSize:textSizeValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-max-width"]) {
            if ([[layoutProperties valueForKey:@"text-max-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-max-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textMaxWidthValue;
                NSNumber *baseNumber = layoutProperties[@"text-max-width"][@"base"];
                if (baseNumber) {
                    textMaxWidthValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textMaxWidthValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setMaximumTextWidth:textMaxWidthValue];
            } else {
                MGLStyleValue *textMaxWidthValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-width"]];
                [layer setMaximumTextWidth:textMaxWidthValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-line-height"]) {
            if ([[layoutProperties valueForKey:@"text-line-height"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-line-height"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textLineHeightValue;
                NSNumber *baseNumber = layoutProperties[@"text-line-height"][@"base"];
                if (baseNumber) {
                    textLineHeightValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textLineHeightValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextLineHeight:textLineHeightValue];
            } else {
                MGLStyleValue *textLineHeightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-line-height"]];
                [layer setTextLineHeight:textLineHeightValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-letter-spacing"]) {
            if ([[layoutProperties valueForKey:@"text-letter-spacing"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-letter-spacing"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textLetterSpacingValue;
                NSNumber *baseNumber = layoutProperties[@"text-letter-spacing"][@"base"];
                if (baseNumber) {
                    textLetterSpacingValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textLetterSpacingValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextLetterSpacing:textLetterSpacingValue];
            } else {
                MGLStyleValue *textLetterSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-letter-spacing"]];
                [layer setTextLetterSpacing:textLetterSpacingValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-justify"]) {
            if ([[layoutProperties valueForKey:@"text-justify"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-justify"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textJustifyValue;
                NSNumber *baseNumber = layoutProperties[@"text-justify"][@"base"];
                if (baseNumber) {
                    textJustifyValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textJustifyValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextJustification:textJustifyValue];
            } else {
                MGLStyleValue *textJustifyValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-justify"]];
                [layer setTextJustification:textJustifyValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-anchor"]) {
            if ([[layoutProperties valueForKey:@"text-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textAnchorValue;
                NSNumber *baseNumber = layoutProperties[@"text-anchor"][@"base"];
                if (baseNumber) {
                    textAnchorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textAnchorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextAnchor:textAnchorValue];
            } else {
                MGLStyleValue *textAnchorValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-anchor"]];
                [layer setTextAnchor:textAnchorValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-max-angle"]) {
            if ([[layoutProperties valueForKey:@"text-max-angle"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-max-angle"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textMaxAngleValue;
                NSNumber *baseNumber = layoutProperties[@"text-max-angle"][@"base"];
                if (baseNumber) {
                    textMaxAngleValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textMaxAngleValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setMaximumTextAngle:textMaxAngleValue];
            } else {
                MGLStyleValue *textMaxAngleValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-angle"]];
                [layer setMaximumTextAngle:textMaxAngleValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-rotate"]) {
            if ([[layoutProperties valueForKey:@"text-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textRotateValue;
                NSNumber *baseNumber = layoutProperties[@"text-rotate"][@"base"];
                if (baseNumber) {
                    textRotateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textRotateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextRotation:textRotateValue];
            } else {
                MGLStyleValue *textRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-rotate"]];
                [layer setTextRotation:textRotateValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-padding"]) {
            if ([[layoutProperties valueForKey:@"text-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textPaddingValue;
                NSNumber *baseNumber = layoutProperties[@"text-padding"][@"base"];
                if (baseNumber) {
                    textPaddingValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textPaddingValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextPadding:textPaddingValue];
            } else {
                MGLStyleValue *textPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-padding"]];
                [layer setTextPadding:textPaddingValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-keep-upright"]) {
            if ([[layoutProperties valueForKey:@"text-keep-upright"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-keep-upright"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textKeepUprightValue;
                NSNumber *baseNumber = layoutProperties[@"text-keep-upright"][@"base"];
                if (baseNumber) {
                    textKeepUprightValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textKeepUprightValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setKeepsTextUpright:textKeepUprightValue];
            } else {
                MGLStyleValue *textKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-keep-upright"]];
                [layer setKeepsTextUpright:textKeepUprightValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-transform"]) {
            if ([[layoutProperties valueForKey:@"text-transform"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-transform"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textTransformValue;
                NSNumber *baseNumber = layoutProperties[@"text-transform"][@"base"];
                if (baseNumber) {
                    textTransformValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textTransformValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextTransform:textTransformValue];
            } else {
                MGLStyleValue *textTransformValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-transform"]];
                [layer setTextTransform:textTransformValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-offset"]) {
            if ([[layoutProperties valueForKey:@"text-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *textOffsetValue;
                NSNumber *baseNumber = layoutProperties[@"text-offset"][@"base"];
                if (baseNumber) {
                    textOffsetValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textOffsetValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextOffset:textOffsetValue];
            } else {
                CGVector vector = CGVectorMake([layoutProperties[@"text-offset"][0] floatValue], [layoutProperties[@"text-offset"][1] floatValue]);
                MGLStyleValue *textOffsetValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setTextOffset:textOffsetValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-allow-overlap"]) {
            if ([[layoutProperties valueForKey:@"text-allow-overlap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-allow-overlap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textAllowOverlapValue;
                NSNumber *baseNumber = layoutProperties[@"text-allow-overlap"][@"base"];
                if (baseNumber) {
                    textAllowOverlapValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textAllowOverlapValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextAllowsOverlap:textAllowOverlapValue];
            } else {
                MGLStyleValue *textAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-allow-overlap"]];
                [layer setTextAllowsOverlap:textAllowOverlapValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-ignore-placement"]) {
            if ([[layoutProperties valueForKey:@"text-ignore-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-ignore-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textIgnorePlacementValue;
                NSNumber *baseNumber = layoutProperties[@"text-ignore-placement"][@"base"];
                if (baseNumber) {
                    textIgnorePlacementValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textIgnorePlacementValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextIgnoresPlacement:textIgnorePlacementValue];
            } else {
                MGLStyleValue *textIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-ignore-placement"]];
                [layer setTextIgnoresPlacement:textIgnorePlacementValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-optional"]) {
            if ([[layoutProperties valueForKey:@"text-optional"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-optional"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textOptionalValue;
                NSNumber *baseNumber = layoutProperties[@"text-optional"][@"base"];
                if (baseNumber) {
                    textOptionalValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textOptionalValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextOptional:textOptionalValue];
            } else {
                MGLStyleValue *textOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-optional"]];
                [layer setTextOptional:textOptionalValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-opacity"]) {
            if ([[paintProperties valueForKey:@"icon-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconOpacityValue;
                NSNumber *baseNumber = paintProperties[@"icon-opacity"][@"base"];
                if (baseNumber) {
                    iconOpacityValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconOpacity:iconOpacityValue];
            } else {
                MGLStyleValue *iconOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-opacity"]];
                [layer setIconOpacity:iconOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-color"]) {
            if ([[paintProperties valueForKey:@"icon-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *iconColorValue;
                NSNumber *baseNumber = paintProperties[@"icon-color"][@"base"];
                if (baseNumber) {
                    iconColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconColor:iconColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"icon-color"]];
                MGLStyleValue *iconColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setIconColor:iconColorValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-color"]) {
            if ([[paintProperties valueForKey:@"icon-halo-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *iconHaloColorValue;
                NSNumber *baseNumber = paintProperties[@"icon-halo-color"][@"base"];
                if (baseNumber) {
                    iconHaloColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconHaloColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconHaloColor:iconHaloColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"icon-halo-color"]];
                MGLStyleValue *iconHaloColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setIconHaloColor:iconHaloColorValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-width"]) {
            if ([[paintProperties valueForKey:@"icon-halo-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconHaloWidthValue;
                NSNumber *baseNumber = paintProperties[@"icon-halo-width"][@"base"];
                if (baseNumber) {
                    iconHaloWidthValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconHaloWidthValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconHaloWidth:iconHaloWidthValue];
            } else {
                MGLStyleValue *iconHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-width"]];
                [layer setIconHaloWidth:iconHaloWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-blur"]) {
            if ([[paintProperties valueForKey:@"icon-halo-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconHaloBlurValue;
                NSNumber *baseNumber = paintProperties[@"icon-halo-blur"][@"base"];
                if (baseNumber) {
                    iconHaloBlurValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconHaloBlurValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconHaloBlur:iconHaloBlurValue];
            } else {
                MGLStyleValue *iconHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-blur"]];
                [layer setIconHaloBlur:iconHaloBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-translate"]) {
            if ([[paintProperties valueForKey:@"icon-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *iconTranslateValue;
                NSNumber *baseNumber = paintProperties[@"icon-translate"][@"base"];
                if (baseNumber) {
                    iconTranslateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconTranslateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconTranslate:iconTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"icon-translate"][0] floatValue], [paintProperties[@"icon-translate"][1] floatValue]);
                MGLStyleValue *iconTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setIconTranslate:iconTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-translate-anchor"]) {
            if ([[paintProperties valueForKey:@"icon-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *iconTranslateAnchorValue;
                NSNumber *baseNumber = paintProperties[@"icon-translate-anchor"][@"base"];
                if (baseNumber) {
                    iconTranslateAnchorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    iconTranslateAnchorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setIconTranslateAnchor:iconTranslateAnchorValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"icon-translate-anchor"][0] floatValue], [paintProperties[@"icon-translate-anchor"][1] floatValue]);
                MGLStyleValue *iconTranslateAnchorValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setIconTranslateAnchor:iconTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"text-opacity"]) {
            if ([[paintProperties valueForKey:@"text-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textOpacityValue;
                NSNumber *baseNumber = paintProperties[@"text-opacity"][@"base"];
                if (baseNumber) {
                    textOpacityValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextOpacity:textOpacityValue];
            } else {
                MGLStyleValue *textOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-opacity"]];
                [layer setTextOpacity:textOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"text-color"]) {
            if ([[paintProperties valueForKey:@"text-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *textColorValue;
                NSNumber *baseNumber = paintProperties[@"text-color"][@"base"];
                if (baseNumber) {
                    textColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextColor:textColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"text-color"]];
                MGLStyleValue *textColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setTextColor:textColorValue];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-color"]) {
            if ([[paintProperties valueForKey:@"text-halo-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *textHaloColorValue;
                NSNumber *baseNumber = paintProperties[@"text-halo-color"][@"base"];
                if (baseNumber) {
                    textHaloColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textHaloColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextHaloColor:textHaloColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"text-halo-color"]];
                MGLStyleValue *textHaloColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setTextHaloColor:textHaloColorValue];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-width"]) {
            if ([[paintProperties valueForKey:@"text-halo-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textHaloWidthValue;
                NSNumber *baseNumber = paintProperties[@"text-halo-width"][@"base"];
                if (baseNumber) {
                    textHaloWidthValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textHaloWidthValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextHaloWidth:textHaloWidthValue];
            } else {
                MGLStyleValue *textHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-width"]];
                [layer setTextHaloWidth:textHaloWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-blur"]) {
            if ([[paintProperties valueForKey:@"text-halo-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textHaloBlurValue;
                NSNumber *baseNumber = paintProperties[@"text-halo-blur"][@"base"];
                if (baseNumber) {
                    textHaloBlurValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textHaloBlurValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextHaloBlur:textHaloBlurValue];
            } else {
                MGLStyleValue *textHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-blur"]];
                [layer setTextHaloBlur:textHaloBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"text-translate"]) {
            if ([[paintProperties valueForKey:@"text-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *textTranslateValue;
                NSNumber *baseNumber = paintProperties[@"text-translate"][@"base"];
                if (baseNumber) {
                    textTranslateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textTranslateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextTranslate:textTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"text-translate"][0] floatValue], [paintProperties[@"text-translate"][1] floatValue]);
                MGLStyleValue *textTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setTextTranslate:textTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"text-translate-anchor"]) {
            if ([[paintProperties valueForKey:@"text-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *textTranslateAnchorValue;
                NSNumber *baseNumber = paintProperties[@"text-translate-anchor"][@"base"];
                if (baseNumber) {
                    textTranslateAnchorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    textTranslateAnchorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setTextTranslateAnchor:textTranslateAnchorValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"text-translate-anchor"][0] floatValue], [paintProperties[@"text-translate-anchor"][1] floatValue]);
                MGLStyleValue *textTranslateAnchorValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setTextTranslateAnchor:textTranslateAnchorValue];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];

        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateFromJson:filter]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"circle"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLCircleStyleLayer *layer = [[MGLCircleStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([paintProperties valueForKey:@"circle-radius"]) {
            if ([[paintProperties valueForKey:@"circle-radius"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-radius"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *circleRadiusValue;
                NSNumber *baseNumber = paintProperties[@"circle-radius"][@"base"];
                if (baseNumber) {
                    circleRadiusValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    circleRadiusValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setCircleRadius:circleRadiusValue];
            } else {
                MGLStyleValue *circleRadiusValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-radius"]];
                [layer setCircleRadius:circleRadiusValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-color"]) {
            if ([[paintProperties valueForKey:@"circle-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *circleColorValue;
                NSNumber *baseNumber = paintProperties[@"circle-color"][@"base"];
                if (baseNumber) {
                    circleColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    circleColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setCircleColor:circleColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"circle-color"]];
                MGLStyleValue *circleColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setCircleColor:circleColorValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-blur"]) {
            if ([[paintProperties valueForKey:@"circle-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *circleBlurValue;
                NSNumber *baseNumber = paintProperties[@"circle-blur"][@"base"];
                if (baseNumber) {
                    circleBlurValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    circleBlurValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setCircleBlur:circleBlurValue];
            } else {
                MGLStyleValue *circleBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-blur"]];
                [layer setCircleBlur:circleBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-opacity"]) {
            if ([[paintProperties valueForKey:@"circle-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *circleOpacityValue;
                NSNumber *baseNumber = paintProperties[@"circle-opacity"][@"base"];
                if (baseNumber) {
                    circleOpacityValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    circleOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setCircleOpacity:circleOpacityValue];
            } else {
                MGLStyleValue *circleOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-opacity"]];
                [layer setCircleOpacity:circleOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-translate"]) {
            if ([[paintProperties valueForKey:@"circle-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *circleTranslateValue;
                NSNumber *baseNumber = paintProperties[@"circle-translate"][@"base"];
                if (baseNumber) {
                    circleTranslateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    circleTranslateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setCircleTranslate:circleTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"circle-translate"][0] floatValue], [paintProperties[@"circle-translate"][1] floatValue]);
                MGLStyleValue *circleTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setCircleTranslate:circleTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-translate-anchor"]) {
            if ([[paintProperties valueForKey:@"circle-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                MGLStyleValue *circleTranslateAnchorValue;
                NSNumber *baseNumber = paintProperties[@"circle-translate-anchor"][@"base"];
                if (baseNumber) {
                    circleTranslateAnchorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    circleTranslateAnchorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setCircleTranslateAnchor:circleTranslateAnchorValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"circle-translate-anchor"][0] floatValue], [paintProperties[@"circle-translate-anchor"][1] floatValue]);
                MGLStyleValue *circleTranslateAnchorValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setCircleTranslateAnchor:circleTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-pitch-scale"]) {
            if ([[paintProperties valueForKey:@"circle-pitch-scale"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-pitch-scale"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *circlePitchScaleValue;
                NSNumber *baseNumber = paintProperties[@"circle-pitch-scale"][@"base"];
                if (baseNumber) {
                    circlePitchScaleValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    circlePitchScaleValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setCirclePitchScale:circlePitchScaleValue];
            } else {
                MGLStyleValue *circlePitchScaleValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-pitch-scale"]];
                [layer setCirclePitchScale:circlePitchScaleValue];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];

        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateFromJson:filter]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"raster"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLRasterStyleLayer *layer = [[MGLRasterStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([paintProperties valueForKey:@"raster-opacity"]) {
            if ([[paintProperties valueForKey:@"raster-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *rasterOpacityValue;
                NSNumber *baseNumber = paintProperties[@"raster-opacity"][@"base"];
                if (baseNumber) {
                    rasterOpacityValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    rasterOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setRasterOpacity:rasterOpacityValue];
            } else {
                MGLStyleValue *rasterOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-opacity"]];
                [layer setRasterOpacity:rasterOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-hue-rotate"]) {
            if ([[paintProperties valueForKey:@"raster-hue-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-hue-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *rasterHueRotateValue;
                NSNumber *baseNumber = paintProperties[@"raster-hue-rotate"][@"base"];
                if (baseNumber) {
                    rasterHueRotateValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    rasterHueRotateValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setRasterHueRotation:rasterHueRotateValue];
            } else {
                MGLStyleValue *rasterHueRotateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-hue-rotate"]];
                [layer setRasterHueRotation:rasterHueRotateValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-brightness-min"]) {
            if ([[paintProperties valueForKey:@"raster-brightness-min"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-brightness-min"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *rasterBrightnessMinValue;
                NSNumber *baseNumber = paintProperties[@"raster-brightness-min"][@"base"];
                if (baseNumber) {
                    rasterBrightnessMinValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    rasterBrightnessMinValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setMinimumRasterBrightness:rasterBrightnessMinValue];
            } else {
                MGLStyleValue *rasterBrightnessMinValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-min"]];
                [layer setMinimumRasterBrightness:rasterBrightnessMinValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-brightness-max"]) {
            if ([[paintProperties valueForKey:@"raster-brightness-max"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-brightness-max"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *rasterBrightnessMaxValue;
                NSNumber *baseNumber = paintProperties[@"raster-brightness-max"][@"base"];
                if (baseNumber) {
                    rasterBrightnessMaxValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    rasterBrightnessMaxValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setMaximumRasterBrightness:rasterBrightnessMaxValue];
            } else {
                MGLStyleValue *rasterBrightnessMaxValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-max"]];
                [layer setMaximumRasterBrightness:rasterBrightnessMaxValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-saturation"]) {
            if ([[paintProperties valueForKey:@"raster-saturation"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-saturation"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *rasterSaturationValue;
                NSNumber *baseNumber = paintProperties[@"raster-saturation"][@"base"];
                if (baseNumber) {
                    rasterSaturationValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    rasterSaturationValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setRasterSaturation:rasterSaturationValue];
            } else {
                MGLStyleValue *rasterSaturationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-saturation"]];
                [layer setRasterSaturation:rasterSaturationValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-contrast"]) {
            if ([[paintProperties valueForKey:@"raster-contrast"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-contrast"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *rasterContrastValue;
                NSNumber *baseNumber = paintProperties[@"raster-contrast"][@"base"];
                if (baseNumber) {
                    rasterContrastValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    rasterContrastValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setRasterContrast:rasterContrastValue];
            } else {
                MGLStyleValue *rasterContrastValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-contrast"]];
                [layer setRasterContrast:rasterContrastValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-fade-duration"]) {
            if ([[paintProperties valueForKey:@"raster-fade-duration"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-fade-duration"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *rasterFadeDurationValue;
                NSNumber *baseNumber = paintProperties[@"raster-fade-duration"][@"base"];
                if (baseNumber) {
                    rasterFadeDurationValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    rasterFadeDurationValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setRasterFadeDuration:rasterFadeDurationValue];
            } else {
                MGLStyleValue *rasterFadeDurationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-fade-duration"]];
                [layer setRasterFadeDuration:rasterFadeDurationValue];
            }
        }
        return layer;
    }
    if([typeString isEqualToString:@"background"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        MGLBackgroundStyleLayer *layer = [[MGLBackgroundStyleLayer alloc] initWithIdentifier:idString];
        if ([paintProperties valueForKey:@"background-color"]) {
            if ([[paintProperties valueForKey:@"background-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorFromString:stop[1]]] forKey:stop[0]];
                }
                MGLStyleValue *backgroundColorValue;
                NSNumber *baseNumber = paintProperties[@"background-color"][@"base"];
                if (baseNumber) {
                    backgroundColorValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    backgroundColorValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setBackgroundColor:backgroundColorValue];
            } else {
                UIColor *color = [UIColor colorFromString:paintProperties[@"background-color"]];
                MGLStyleValue *backgroundColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setBackgroundColor:backgroundColorValue];
            }
        }
        if ([paintProperties valueForKey:@"background-pattern"]) {
            if ([[paintProperties valueForKey:@"background-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *backgroundPatternValue;
                NSNumber *baseNumber = paintProperties[@"background-pattern"][@"base"];
                if (baseNumber) {
                    backgroundPatternValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    backgroundPatternValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setBackgroundPattern:backgroundPatternValue];
            } else {
                MGLStyleValue *backgroundPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-pattern"]];
                [layer setBackgroundPattern:backgroundPatternValue];
            }
        }
        if ([paintProperties valueForKey:@"background-opacity"]) {
            if ([[paintProperties valueForKey:@"background-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *backgroundOpacityValue;
                NSNumber *baseNumber = paintProperties[@"background-opacity"][@"base"];
                if (baseNumber) {
                    backgroundOpacityValue = [MGLStyleValue valueWithInterpolationBase:[baseNumber floatValue] stops:stopsDict];
                } else {
                    backgroundOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
                }
                [layer setBackgroundOpacity:backgroundOpacityValue];
            } else {
                MGLStyleValue *backgroundOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-opacity"]];
                [layer setBackgroundOpacity:backgroundOpacityValue];
            }
        }
        return layer;
    }
    return nil;
}

- (NSPredicate *)predicateFromJson:(nonnull NSArray *)filterJson
{
    NSString *filterType = filterJson[0];
    if ([filterType isEqualToString:@"=="]) {
        return [NSPredicate predicateWithFormat:@"%K == %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"!="]) {
        return [NSPredicate predicateWithFormat:@"%K != %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"<"]) {
        return [NSPredicate predicateWithFormat:@"%K < %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"<="]) {
        return [NSPredicate predicateWithFormat:@"%K <= %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@">"]) {
        return [NSPredicate predicateWithFormat:@"%K > %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@">="]) {
        return [NSPredicate predicateWithFormat:@"%K >= %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"has"]) {
        return [NSPredicate predicateWithFormat:@"%K == %@", filterJson[1], nil];
    }
    if ([filterType isEqualToString:@"!has"]) {
        return [NSPredicate predicateWithFormat:@"%K != %@", filterJson[1], nil];
    }
    if ([filterType isEqualToString:@"in"]) {
        NSMutableArray *elementsArray = [NSMutableArray arrayWithArray:filterJson];
        [elementsArray removeObjectAtIndex:0];
        [elementsArray removeObjectAtIndex:0];
        return [NSPredicate predicateWithFormat:@"%K IN %@", filterJson[1], elementsArray];
    }
    if ([filterType isEqualToString:@"!in"]) {
        NSMutableArray *elementsArray = [NSMutableArray arrayWithArray:filterJson];
        [elementsArray removeObjectAtIndex:0];
        [elementsArray removeObjectAtIndex:0];
        return [NSPredicate predicateWithFormat:@"%K !IN %@", filterJson[1], elementsArray];
    }
    if ([filterType isEqualToString:@"all"]) {
        NSMutableArray *filters = [NSMutableArray arrayWithArray:filterJson];
        [filters removeObjectAtIndex:0];
        NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:[filters count]];
        for (id filter in filters) {
            [predicates addObject:[self predicateFromJson:filter]];
        }
        return [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
    }
    if ([filterType isEqualToString:@"any"]) {
        NSMutableArray *filters = [NSMutableArray arrayWithArray:filterJson];
        [filters removeObjectAtIndex:0];
        NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:[filters count]];
        for (id filter in filters) {
            [predicates addObject:[self predicateFromJson:filter]];
        }
        return [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
    }
    if ([filterType isEqualToString:@"none"]) {
        NSMutableArray *filters = [NSMutableArray arrayWithArray:filterJson];
        [filters removeObjectAtIndex:0];
        NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:[filters count]];
        for (id filter in filters) {
            [predicates addObject:[NSCompoundPredicate notPredicateWithSubpredicate:[self predicateFromJson:filter]]];
        }
        return [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
    }
    return nil;
}

@end
