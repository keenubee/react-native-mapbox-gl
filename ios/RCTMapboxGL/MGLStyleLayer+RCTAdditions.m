//
// Copyright (c) 2016 Mapbox. All rights reserved.
//
// This file is generated. See scripts/generate-layer-factory.js

#import "MGLStyleLayer+RCTAdditions.h"


@implementation MGLStyleLayer (RCTAdditions)

+ (MGLStyleLayer *)fromJson:(nonnull NSDictionary *)layerJson
{
    NSString *idString = layerJson[@"id"];
    NSString *typeString = layerJson[@"type"];
    if (!idString || !typeString) {
        return;
    }
    if([typeString isEqualToString:@"fill"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLFillStyleLayer *layer = [[MGLFillStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([[paintProperties valueForKey:@"fill-antialias"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *fillAntialiasValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-antialias"]];
            [layer setFillAntialias:fillAntialiasValue];
        }
        if ([[paintProperties valueForKey:@"fill-opacity"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *fillOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-opacity"]];
            [layer setFillOpacity:fillOpacityValue];
        }
        if ([[paintProperties valueForKey:@"fill-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *fillColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-color"]];
            [layer setFillColor:fillColorValue];
        }
        if ([[paintProperties valueForKey:@"fill-outline-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *fillOutlineColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-outline-color"]];
            [layer setFillOutlineColor:fillOutlineColorValue];
        }
        if ([[paintProperties valueForKey:@"fill-translate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *fillTranslateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-translate"]];
            [layer setFillTranslate:fillTranslateValue];
        }
        if ([[paintProperties valueForKey:@"fill-translate-anchor"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *fillTranslateAnchorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-translate-anchor"]];
            [layer setFillTranslateAnchor:fillTranslateAnchorValue];
        }
        if ([[paintProperties valueForKey:@"fill-pattern"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *fillPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-pattern"]];
            [layer setFillPattern:fillPatternValue];
        }
        return layer;
    }
    if([typeString isEqualToString:@"line"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSDictionary *layoutProperties = layerJson[@"layout"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLLineStyleLayer *layer = [[MGLLineStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([[layoutProperties valueForKey:@"line-cap"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineCapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-cap"]];
            [layer setLineCap:lineCapValue];
        }
        if ([[layoutProperties valueForKey:@"line-join"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineJoinValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-join"]];
            [layer setLineJoin:lineJoinValue];
        }
        if ([[layoutProperties valueForKey:@"line-miter-limit"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineMiterLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-miter-limit"]];
            [layer setLineMiterLimit:lineMiterLimitValue];
        }
        if ([[layoutProperties valueForKey:@"line-round-limit"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineRoundLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-round-limit"]];
            [layer setLineRoundLimit:lineRoundLimitValue];
        }
        if ([[paintProperties valueForKey:@"line-opacity"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-opacity"]];
            [layer setLineOpacity:lineOpacityValue];
        }
        if ([[paintProperties valueForKey:@"line-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-color"]];
            [layer setLineColor:lineColorValue];
        }
        if ([[paintProperties valueForKey:@"line-translate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineTranslateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-translate"]];
            [layer setLineTranslate:lineTranslateValue];
        }
        if ([[paintProperties valueForKey:@"line-translate-anchor"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineTranslateAnchorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-translate-anchor"]];
            [layer setLineTranslateAnchor:lineTranslateAnchorValue];
        }
        if ([[paintProperties valueForKey:@"line-width"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-width"]];
            [layer setLineWidth:lineWidthValue];
        }
        if ([[paintProperties valueForKey:@"line-gap-width"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineGapWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-gap-width"]];
            [layer setLineGapWidth:lineGapWidthValue];
        }
        if ([[paintProperties valueForKey:@"line-offset"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineOffsetValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-offset"]];
            [layer setLineOffset:lineOffsetValue];
        }
        if ([[paintProperties valueForKey:@"line-blur"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-blur"]];
            [layer setLineBlur:lineBlurValue];
        }
        if ([[paintProperties valueForKey:@"line-dasharray"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *lineDasharrayValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-dasharray"]];
            [layer setLineDasharray:lineDasharrayValue];
        }
        if ([[paintProperties valueForKey:@"line-pattern"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *linePatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-pattern"]];
            [layer setLinePattern:linePatternValue];
        }
        return layer;
    }
    if([typeString isEqualToString:@"symbol"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSDictionary *layoutProperties = layerJson[@"layout"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLSymbolStyleLayer *layer = [[MGLSymbolStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([[layoutProperties valueForKey:@"symbol-placement"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *symbolPlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-placement"]];
            [layer setSymbolPlacement:symbolPlacementValue];
        }
        if ([[layoutProperties valueForKey:@"symbol-spacing"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *symbolSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-spacing"]];
            [layer setSymbolSpacing:symbolSpacingValue];
        }
        if ([[layoutProperties valueForKey:@"symbol-avoid-edges"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *symbolAvoidEdgesValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-avoid-edges"]];
            [layer setSymbolAvoidEdges:symbolAvoidEdgesValue];
        }
        if ([[layoutProperties valueForKey:@"icon-allow-overlap"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-allow-overlap"]];
            [layer setIconAllowOverlap:iconAllowOverlapValue];
        }
        if ([[layoutProperties valueForKey:@"icon-ignore-placement"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-ignore-placement"]];
            [layer setIconIgnorePlacement:iconIgnorePlacementValue];
        }
        if ([[layoutProperties valueForKey:@"icon-optional"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-optional"]];
            [layer setIconOptional:iconOptionalValue];
        }
        if ([[layoutProperties valueForKey:@"icon-rotation-alignment"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconRotationAlignmentValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-rotation-alignment"]];
            [layer setIconRotationAlignment:iconRotationAlignmentValue];
        }
        if ([[layoutProperties valueForKey:@"icon-size"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-size"]];
            [layer setIconSize:iconSizeValue];
        }
        if ([[layoutProperties valueForKey:@"icon-text-fit"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconTextFitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-text-fit"]];
            [layer setIconTextFit:iconTextFitValue];
        }
        if ([[layoutProperties valueForKey:@"icon-text-fit-padding"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconTextFitPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-text-fit-padding"]];
            [layer setIconTextFitPadding:iconTextFitPaddingValue];
        }
        if ([[layoutProperties valueForKey:@"icon-image"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconImageValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-image"]];
            [layer setIconImage:iconImageValue];
        }
        if ([[layoutProperties valueForKey:@"icon-rotate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-rotate"]];
            [layer setIconRotate:iconRotateValue];
        }
        if ([[layoutProperties valueForKey:@"icon-padding"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-padding"]];
            [layer setIconPadding:iconPaddingValue];
        }
        if ([[layoutProperties valueForKey:@"icon-keep-upright"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-keep-upright"]];
            [layer setIconKeepUpright:iconKeepUprightValue];
        }
        if ([[layoutProperties valueForKey:@"icon-offset"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconOffsetValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-offset"]];
            [layer setIconOffset:iconOffsetValue];
        }
        if ([[layoutProperties valueForKey:@"text-pitch-alignment"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textPitchAlignmentValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-pitch-alignment"]];
            [layer setTextPitchAlignment:textPitchAlignmentValue];
        }
        if ([[layoutProperties valueForKey:@"text-rotation-alignment"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textRotationAlignmentValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-rotation-alignment"]];
            [layer setTextRotationAlignment:textRotationAlignmentValue];
        }
        if ([[layoutProperties valueForKey:@"text-field"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textFieldValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-field"]];
            [layer setTextField:textFieldValue];
        }
        if ([[layoutProperties valueForKey:@"text-font"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textFontValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-font"]];
            [layer setTextFont:textFontValue];
        }
        if ([[layoutProperties valueForKey:@"text-size"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-size"]];
            [layer setTextSize:textSizeValue];
        }
        if ([[layoutProperties valueForKey:@"text-max-width"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textMaxWidthValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-width"]];
            [layer setTextMaxWidth:textMaxWidthValue];
        }
        if ([[layoutProperties valueForKey:@"text-line-height"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textLineHeightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-line-height"]];
            [layer setTextLineHeight:textLineHeightValue];
        }
        if ([[layoutProperties valueForKey:@"text-letter-spacing"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textLetterSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-letter-spacing"]];
            [layer setTextLetterSpacing:textLetterSpacingValue];
        }
        if ([[layoutProperties valueForKey:@"text-justify"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textJustifyValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-justify"]];
            [layer setTextJustify:textJustifyValue];
        }
        if ([[layoutProperties valueForKey:@"text-anchor"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textAnchorValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-anchor"]];
            [layer setTextAnchor:textAnchorValue];
        }
        if ([[layoutProperties valueForKey:@"text-max-angle"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textMaxAngleValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-angle"]];
            [layer setTextMaxAngle:textMaxAngleValue];
        }
        if ([[layoutProperties valueForKey:@"text-rotate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-rotate"]];
            [layer setTextRotate:textRotateValue];
        }
        if ([[layoutProperties valueForKey:@"text-padding"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-padding"]];
            [layer setTextPadding:textPaddingValue];
        }
        if ([[layoutProperties valueForKey:@"text-keep-upright"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-keep-upright"]];
            [layer setTextKeepUpright:textKeepUprightValue];
        }
        if ([[layoutProperties valueForKey:@"text-transform"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textTransformValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-transform"]];
            [layer setTextTransform:textTransformValue];
        }
        if ([[layoutProperties valueForKey:@"text-offset"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textOffsetValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-offset"]];
            [layer setTextOffset:textOffsetValue];
        }
        if ([[layoutProperties valueForKey:@"text-allow-overlap"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-allow-overlap"]];
            [layer setTextAllowOverlap:textAllowOverlapValue];
        }
        if ([[layoutProperties valueForKey:@"text-ignore-placement"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-ignore-placement"]];
            [layer setTextIgnorePlacement:textIgnorePlacementValue];
        }
        if ([[layoutProperties valueForKey:@"text-optional"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-optional"]];
            [layer setTextOptional:textOptionalValue];
        }
        if ([[paintProperties valueForKey:@"icon-opacity"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-opacity"]];
            [layer setIconOpacity:iconOpacityValue];
        }
        if ([[paintProperties valueForKey:@"icon-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-color"]];
            [layer setIconColor:iconColorValue];
        }
        if ([[paintProperties valueForKey:@"icon-halo-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconHaloColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-color"]];
            [layer setIconHaloColor:iconHaloColorValue];
        }
        if ([[paintProperties valueForKey:@"icon-halo-width"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-width"]];
            [layer setIconHaloWidth:iconHaloWidthValue];
        }
        if ([[paintProperties valueForKey:@"icon-halo-blur"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-blur"]];
            [layer setIconHaloBlur:iconHaloBlurValue];
        }
        if ([[paintProperties valueForKey:@"icon-translate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconTranslateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-translate"]];
            [layer setIconTranslate:iconTranslateValue];
        }
        if ([[paintProperties valueForKey:@"icon-translate-anchor"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *iconTranslateAnchorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-translate-anchor"]];
            [layer setIconTranslateAnchor:iconTranslateAnchorValue];
        }
        if ([[paintProperties valueForKey:@"text-opacity"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-opacity"]];
            [layer setTextOpacity:textOpacityValue];
        }
        if ([[paintProperties valueForKey:@"text-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-color"]];
            [layer setTextColor:textColorValue];
        }
        if ([[paintProperties valueForKey:@"text-halo-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textHaloColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-color"]];
            [layer setTextHaloColor:textHaloColorValue];
        }
        if ([[paintProperties valueForKey:@"text-halo-width"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-width"]];
            [layer setTextHaloWidth:textHaloWidthValue];
        }
        if ([[paintProperties valueForKey:@"text-halo-blur"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-blur"]];
            [layer setTextHaloBlur:textHaloBlurValue];
        }
        if ([[paintProperties valueForKey:@"text-translate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textTranslateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-translate"]];
            [layer setTextTranslate:textTranslateValue];
        }
        if ([[paintProperties valueForKey:@"text-translate-anchor"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *textTranslateAnchorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-translate-anchor"]];
            [layer setTextTranslateAnchor:textTranslateAnchorValue];
        }
        return layer;
    }
    if([typeString isEqualToString:@"circle"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLCircleStyleLayer *layer = [[MGLCircleStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([[paintProperties valueForKey:@"circle-radius"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleRadiusValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-radius"]];
            [layer setCircleRadius:circleRadiusValue];
        }
        if ([[paintProperties valueForKey:@"circle-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-color"]];
            [layer setCircleColor:circleColorValue];
        }
        if ([[paintProperties valueForKey:@"circle-blur"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-blur"]];
            [layer setCircleBlur:circleBlurValue];
        }
        if ([[paintProperties valueForKey:@"circle-opacity"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-opacity"]];
            [layer setCircleOpacity:circleOpacityValue];
        }
        if ([[paintProperties valueForKey:@"circle-translate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleTranslateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-translate"]];
            [layer setCircleTranslate:circleTranslateValue];
        }
        if ([[paintProperties valueForKey:@"circle-translate-anchor"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleTranslateAnchorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-translate-anchor"]];
            [layer setCircleTranslateAnchor:circleTranslateAnchorValue];
        }
        if ([[paintProperties valueForKey:@"circle-pitch-scale"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circlePitchScaleValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-pitch-scale"]];
            [layer setCirclePitchScale:circlePitchScaleValue];
        }
        return layer;
    }
    if([typeString isEqualToString:@"raster"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLRasterStyleLayer *layer = [[MGLRasterStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([[paintProperties valueForKey:@"raster-opacity"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *rasterOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-opacity"]];
            [layer setRasterOpacity:rasterOpacityValue];
        }
        if ([[paintProperties valueForKey:@"raster-hue-rotate"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *rasterHueRotateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-hue-rotate"]];
            [layer setRasterHueRotate:rasterHueRotateValue];
        }
        if ([[paintProperties valueForKey:@"raster-brightness-min"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *rasterBrightnessMinValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-min"]];
            [layer setRasterBrightnessMin:rasterBrightnessMinValue];
        }
        if ([[paintProperties valueForKey:@"raster-brightness-max"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *rasterBrightnessMaxValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-max"]];
            [layer setRasterBrightnessMax:rasterBrightnessMaxValue];
        }
        if ([[paintProperties valueForKey:@"raster-saturation"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *rasterSaturationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-saturation"]];
            [layer setRasterSaturation:rasterSaturationValue];
        }
        if ([[paintProperties valueForKey:@"raster-contrast"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *rasterContrastValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-contrast"]];
            [layer setRasterContrast:rasterContrastValue];
        }
        if ([[paintProperties valueForKey:@"raster-fade-duration"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *rasterFadeDurationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-fade-duration"]];
            [layer setRasterFadeDuration:rasterFadeDurationValue];
        }
        return layer;
    }
    if([typeString isEqualToString:@"background"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        MGLBackgroundStyleLayer *layer = [[MGLBackgroundStyleLayer alloc] initWithIdentifier:idString];
        if ([[paintProperties valueForKey:@"background-color"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *backgroundColorValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-color"]];
            [layer setBackgroundColor:backgroundColorValue];
        }
        if ([[paintProperties valueForKey:@"background-pattern"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *backgroundPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-pattern"]];
            [layer setBackgroundPattern:backgroundPatternValue];
        }
        if ([[paintProperties valueForKey:@"background-opacity"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *backgroundOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-opacity"]];
            [layer setBackgroundOpacity:backgroundOpacityValue];
        }
        return layer;
    }
    if([typeString isEqualToString:@"circle"]) {
        NSString *sourceString = layerJson[@"source"];
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSDictionary *layoutProperties = layerJson[@"layout"];
        if (!sourceString || !paintProperties) {
            return;
        }
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        MGLCircleStyleLayer *layer = [[MGLCircleStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([[paintProperties valueForKey:@"circle-radius"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleRadiusValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-radius"]];
            [layer setCircleRadius:circleRadiusValue];
        }
        if ([[paintProperties valueForKey:@"circle-color"] isKindOfClass:[NSString class]]) {
            UIColor *color = [self colorFromHexString:paintProperties[@"circle-color"]];
            MGLStyleValue *circleColorValue = [MGLStyleValue valueWithRawValue:color];
            [layer setCircleColor:circleColorValue];
        }
        if ([[paintProperties valueForKey:@"circle-blur"] isKindOfClass:[NSNumber class]]) {
            MGLStyleValue *circleBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-blur"]];
            [layer setCircleBlur:circleBlurValue];
        }
        MGLStyleLayer *previousLayer = [mapView styleLayerWithIdentifier:previousLayerId];
        if (!previousLayer) {
            return;
        }
        return layer;
    }
    else if([typeString isEqualToString:@"background"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        if (!paintProperties) {
            return;
        }
        MGLBackgroundStyleLayer *layer = [[MGLBackgroundStyleLayer alloc] initWithIdentifier:idString];
        if ([[paintProperties valueForKey:@"background-color"] isKindOfClass:[NSString class]]) {
            UIColor *color = [self colorFromHexString:paintProperties[@"background-color"]];
            MGLStyleValue *backgroundColorValue = [MGLStyleValue valueWithRawValue:color];
            [layer setBackgroundColor:backgroundColorValue];
        }
        if ([[paintProperties valueForKey:@"background-opacity"] isKindOfClass:[NSDictionary class]]) {
            NSArray *stops = paintProperties[@"background-opacity"][@"stops"];
            NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
            for (id stop in stops) {
                [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
            }
            MGLStyleValue *backgroundOpacityValue;
            NSNumber *baseNumber = paintProperties[@"background-opacity"][@"base"];
            if (baseNumber) {
                backgroundOpacityValue = [MGLStyleValue valueWithBase:[baseNumber floatValue] stops:stopsDict];
            }
            else {
                backgroundOpacityValue = [MGLStyleValue valueWithStops:stopsDict];
            }
            [layer setBackgroundOpacity:backgroundOpacityValue];
        }
         MGLStyleLayer *previousLayer = [mapView styleLayerWithIdentifier:previousLayerId];
         if (!previousLayer) {
             return;
         }
        return layer;
    }
}

@end
