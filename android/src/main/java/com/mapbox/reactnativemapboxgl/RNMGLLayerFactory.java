package com.mapbox.reactnativemapboxgl;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableType;
import com.mapbox.mapboxsdk.style.layers.*;
import com.mapbox.mapboxsdk.style.sources.*;

import java.lang.Float;
import java.util.ArrayList;

public class RNMGLLayerFactory {

    public static Layer layerFromJson(ReadableMap layerJson) {
        String layerType = layerJson.getString("type");

        if (layerType.equals("background")) {
            return backgroundLayerFromJson(layerJson);
        } else if (layerType.equals("circle")) {
            return circleLayerFromJson(layerJson);
        } else if (layerType.equals("symbol")) {
            return symbolLayerFromJson(layerJson);
        }

        return null;
    }

    static BackgroundLayer backgroundLayerFromJson(ReadableMap layerJson) {
        ReadableMap paintProperties = layerJson.getMap("paint");
        ArrayList<Property> properties = new ArrayList<Property>();
        if (paintProperties.hasKey("background-color") && paintProperties.getType("background-color") == ReadableType.String) {
            properties.add(PropertyFactory.backgroundColor(paintProperties.getString("background-color")));
        }
        if (paintProperties.hasKey("background-opacity") && paintProperties.getType("background-opacity") == ReadableType.Map) {
            ReadableMap map = paintProperties.getMap("background-opacity");
            ReadableArray stops = map.getArray("stops");
            Function.Stop[] stopsArray = new Function.Stop[stops.size()];
            for (int i = 0; i < stops.size(); i++) {
                stopsArray[i] = Function.stop(
                    (float)stops.getArray(i).getDouble(0),
                    PropertyFactory.backgroundOpacity((float)stops.getArray(i).getDouble(1))
                );
            }
            properties.add(PropertyFactory.backgroundOpacity(Function.zoom((float)map.getDouble("base"), stopsArray)));
        }

        return new BackgroundLayer(layerJson.getString("id"))
            .withProperties(properties.toArray(new Property[0]));
    }

    static CircleLayer circleLayerFromJson(ReadableMap layerJson) {
        ReadableMap paintProperties = layerJson.getMap("paint");
        ArrayList<Property> properties = new ArrayList<Property>();
        if (paintProperties.hasKey("circle-blur") && paintProperties.getType("circle-blur") == ReadableType.Number) {
            properties.add(PropertyFactory.circleBlur((float)paintProperties.getDouble("circle-blur")));
        }
        if (paintProperties.hasKey("circle-color") && paintProperties.getType("circle-color") == ReadableType.String) {
            properties.add(PropertyFactory.circleColor(paintProperties.getString("circle-color")));
        }
        if (paintProperties.hasKey("circle-radius") && paintProperties.getType("circle-radius") == ReadableType.Number) {
            properties.add(PropertyFactory.circleRadius((float)paintProperties.getInt("circle-radius")));
        }

        CircleLayer layer = new CircleLayer(layerJson.getString("id"), layerJson.getString("source"))
            .withProperties(properties.toArray(new Property[0]));

        return layer;
    }

    static SymbolLayer symbolLayerFromJson(ReadableMap layerJson) {
        ReadableMap paintProperties = layerJson.getMap("paint");
        ArrayList<Property> properties = new ArrayList<Property>();
        if (paintProperties.hasKey("text-color") && paintProperties.getType("text-color") == ReadableType.String) {
            properties.add(PropertyFactory.textColor(paintProperties.getString("text-color")));
        }
        if (paintProperties.hasKey("text-halo-color") && paintProperties.getType("text-halo-color") == ReadableType.String) {
            properties.add(PropertyFactory.textHaloColor(paintProperties.getString("text-halo-color")));
        }
        if (paintProperties.hasKey("text-halo-width") && paintProperties.getType("text-halo-width") == ReadableType.Number) {
            properties.add(PropertyFactory.textHaloWidth((float)paintProperties.getDouble("text-halo-width")));
        }

        if (layerJson.hasKey("layout")) {
            ReadableMap layoutProperties = layerJson.getMap("layout");
            if (layoutProperties.hasKey("text-field") && layoutProperties.getType("text-field") == ReadableType.String) {
                properties.add(PropertyFactory.textField(layoutProperties.getString("text-field")));
            }
            if (layoutProperties.hasKey("text-font") && layoutProperties.getType("text-font") == ReadableType.Array) {
                ReadableArray font = layoutProperties.getArray("text-font");
                String[] fonts = new String[font.size()];
                for (int i = 0; i < font.size(); i++) {
                    fonts[i] = font.getString(i);
                }
                properties.add(PropertyFactory.textFont(fonts));
            }
            if (layoutProperties.hasKey("text-offset") && layoutProperties.getType("text-offset") == ReadableType.Array) {
                ReadableArray offset = layoutProperties.getArray("text-offset");
                Float[] offsets = new Float[offset.size()];
                for (int i = 0; i < offset.size(); i++) {
                    offsets[i] = (float)offset.getDouble(i);
                }
                properties.add(PropertyFactory.textOffset(offsets));
            }
            if (layoutProperties.hasKey("text-size") && layoutProperties.getType("text-size") == ReadableType.Map) {
                ReadableMap map = layoutProperties.getMap("text-size");
                ReadableArray stops = map.getArray("stops");
                Function.Stop[] stopsArray = new Function.Stop[stops.size()];
                for (int i = 0; i < stops.size(); i++) {
                    stopsArray[i] = Function.stop(
                        (float)stops.getArray(i).getDouble(0),
                        PropertyFactory.textSize((float)stops.getArray(i).getDouble(1))
                    );
                }
                properties.add(PropertyFactory.textSize(Function.zoom((float)map.getDouble("base"), stopsArray)));
            }
        }

        SymbolLayer layer = new SymbolLayer(layerJson.getString("id"), layerJson.getString("source"))
            .withProperties(properties.toArray(new Property[0]));

        if (layerJson.hasKey("filter")) {
            ReadableArray filterJson = layerJson.getArray("filter");
            if (new String("==").equals(filterJson.getString(0)) && filterJson.getType(2) == ReadableType.Number) {
                layer.setFilter(Filter.eq(filterJson.getString(1), filterJson.getInt(2)));
            }
            else if (new String("==").equals(filterJson.getString(0)) && filterJson.getType(2) == ReadableType.String) {
                layer.setFilter(Filter.eq(filterJson.getString(1), filterJson.getString(2)));
            }
        }

        return layer;
    }

}
