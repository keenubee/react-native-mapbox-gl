
package com.mapbox.reactnativemapboxgl;

import com.facebook.infer.annotation.Assertions;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.JSApplicationIllegalArgumentException;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableType;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.common.MapBuilder;
import com.facebook.react.modules.core.RCTNativeAppEventEmitter;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.SimpleViewManager;
import com.mapbox.mapboxsdk.camera.CameraPosition;
import com.mapbox.mapboxsdk.camera.CameraUpdate;
import com.mapbox.mapboxsdk.camera.CameraUpdateFactory;
import com.mapbox.mapboxsdk.constants.MapboxConstants;
import com.mapbox.mapboxsdk.geometry.LatLng;
import com.mapbox.mapboxsdk.geometry.LatLngBounds;
import com.mapbox.mapboxsdk.style.layers.*;
import com.mapbox.mapboxsdk.style.sources.*;
import com.mapbox.services.commons.geojson.Feature;

import java.lang.Float;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import android.graphics.PointF;
import android.graphics.RectF;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class ReactNativeMapboxGLManager extends SimpleViewManager<ReactNativeMapboxGLView> {

    private static final String REACT_CLASS = "RCTMapboxGL";

    private ReactApplicationContext _context;

    public ReactNativeMapboxGLManager(ReactApplicationContext context) {
        super();
        _context = context;
    }

    @Override
    public String getName() {
        return REACT_CLASS;
    }

    public ReactApplicationContext getContext() {
        return _context;
    }

    // Lifecycle methods

    @Override
    public ReactNativeMapboxGLView createViewInstance(ThemedReactContext context) {
        return new ReactNativeMapboxGLView(context, this);
    }

    @Override
    protected void onAfterUpdateTransaction(ReactNativeMapboxGLView view) {
        super.onAfterUpdateTransaction(view);
        view.onAfterUpdateTransaction();
    }

    @Override
    public void onDropViewInstance(ReactNativeMapboxGLView view) {
        view.onDrop();
    }

    // Event types

    public @Nullable Map<String, Object> getExportedCustomDirectEventTypeConstants() {
        return MapBuilder.<String,Object>builder()
                .put("onRegionDidChange", MapBuilder.of("registrationName", "onRegionDidChange"))
                .put("onRegionWillChange", MapBuilder.of("registrationName", "onRegionWillChange"))
                .put("onOpenAnnotation", MapBuilder.of("registrationName", "onOpenAnnotation"))
                .put("onRightAnnotationTapped", MapBuilder.of("registrationName", "onRightAnnotationTapped"))
                .put("onChangeUserTrackingMode", MapBuilder.of("registrationName", "onChangeUserTrackingMode"))
                .put("onUpdateUserLocation", MapBuilder.of("registrationName", "onUpdateUserLocation"))
                .put("onLongPress", MapBuilder.of("registrationName", "onLongPress"))
                .put("onTap", MapBuilder.of("registrationName", "onTap"))
                .put("onFinishLoadingMap", MapBuilder.of("registrationName", "onFinishLoadingMap"))
                .put("onStartLoadingMap", MapBuilder.of("registrationName", "onStartLoadingMap"))
                .put("onLocateUserFailed", MapBuilder.of("registrationName", "onLocateUserFailed"))
                .build();
    }

    // Props

    @ReactProp(name = "initialZoomLevel")
    public void setInitialZoomLevel(ReactNativeMapboxGLView view, double value) {
        view.setInitialZoomLevel(value);
    }

    @ReactProp(name = "initialDirection")
    public void setInitialDirection(ReactNativeMapboxGLView view, double value) {
        view.setInitialDirection(value);
    }

    @ReactProp(name = "initialCenterCoordinate")
    public void setInitialCenterCoordinate(ReactNativeMapboxGLView view, ReadableMap coord) {
        double lat = coord.getDouble("latitude");
        double lon = coord.getDouble("longitude");
        view.setInitialCenterCoordinate(lat, lon);
    }

    @ReactProp(name = "enableOnRegionDidChange")
    public void setEnableOnRegionDidChange(ReactNativeMapboxGLView view, boolean value) {
        view.setEnableOnRegionDidChange(value);
    }

    @ReactProp(name = "enableOnRegionWillChange")
    public void setEnableOnRegionWillChange(ReactNativeMapboxGLView view, boolean value) {
        view.setEnableOnRegionWillChange(value);
    }

    @ReactProp(name = "debugActive")
    public void setDebugActive(ReactNativeMapboxGLView view, boolean value) {
        view.setDebugActive(value);
    }

    @ReactProp(name = "rotateEnabled")
    public void setRotateEnabled(ReactNativeMapboxGLView view, boolean value) {
        view.setRotateEnabled(value);
    }

    @ReactProp(name = "scrollEnabled")
    public void setScrollEnabled(ReactNativeMapboxGLView view, boolean value) {
        view.setScrollEnabled(value);
    }

    @ReactProp(name = "zoomEnabled")
    public void setZoomEnabled(ReactNativeMapboxGLView view, boolean value) {
        view.setZoomEnabled(value);
    }

    @ReactProp(name = "pitchEnabled")
    public void setPitchEnabled(ReactNativeMapboxGLView view, boolean value) {
        view.setPitchEnabled(value);
    }

    @ReactProp(name = "showsUserLocation")
    public void setShowsUserLocation(ReactNativeMapboxGLView view, boolean value) {
        view.setShowsUserLocation(value);
    }

    @ReactProp(name = "styleURL")
    public void setStyleUrl(ReactNativeMapboxGLView view, @Nonnull String styleURL) {
        view.setStyleURL(styleURL);
    }

    @ReactProp(name = "userTrackingMode")
    public void setUserTrackingMode(ReactNativeMapboxGLView view, int mode) {
        view.setLocationTracking(ReactNativeMapboxGLModule.locationTrackingModes[mode]);
        view.setBearingTracking(ReactNativeMapboxGLModule.bearingTrackingModes[mode]);
    }

    @ReactProp(name = "attributionButtonIsHidden")
    public void setAttributionButtonIsHidden(ReactNativeMapboxGLView view, boolean value) {
        view.setAttributionButtonIsHidden(value);
    }

    @ReactProp(name = "logoIsHidden")
    public void setLogoIsHidden(ReactNativeMapboxGLView view, boolean value) {
        view.setLogoIsHidden(value);
    }

    @ReactProp(name = "compassIsHidden")
    public void setCompassIsHidden(ReactNativeMapboxGLView view, boolean value) {
        view.setCompassIsHidden(value);
    }

    @ReactProp(name = "contentInset")
    public void setContentInset(ReactNativeMapboxGLView view, ReadableArray inset) {
        view.setContentInset(inset.getInt(0), inset.getInt(1), inset.getInt(2), inset.getInt(3));
    }

    // Commands

    public static final int COMMAND_GET_DIRECTION = 0;
    public static final int COMMAND_GET_PITCH = 1;
    public static final int COMMAND_GET_CENTER_COORDINATE_ZOOM_LEVEL = 2;
    public static final int COMMAND_GET_BOUNDS = 3;
    public static final int COMMAND_EASE_TO = 4;
    public static final int COMMAND_SET_VISIBLE_COORDINATE_BOUNDS = 6;
    public static final int COMMAND_SELECT_ANNOTATION = 7;
    public static final int COMMAND_SPLICE_ANNOTATIONS = 8;
    public static final int COMMAND_QUERY_RENDERED_FEATURES = 9;
    public static final int COMMAND_ADD_LAYER = 10;
    public static final int COMMAND_ADD_SOURCE = 11;

    @Override
    public
    @Nullable
    Map<String, Integer> getCommandsMap() {
        return MapBuilder.<String, Integer>builder()
                .put("getDirection", COMMAND_GET_DIRECTION)
                .put("getPitch", COMMAND_GET_PITCH)
                .put("getCenterCoordinateZoomLevel", COMMAND_GET_CENTER_COORDINATE_ZOOM_LEVEL)
                .put("getBounds", COMMAND_GET_BOUNDS)
                .put("easeTo", COMMAND_EASE_TO)
                .put("setVisibleCoordinateBounds", COMMAND_SET_VISIBLE_COORDINATE_BOUNDS)
                .put("selectAnnotation", COMMAND_SELECT_ANNOTATION)
                .put("spliceAnnotations", COMMAND_SPLICE_ANNOTATIONS)
                .put("queryRenderedFeatures", COMMAND_QUERY_RENDERED_FEATURES)
                .put("addLayer", COMMAND_ADD_LAYER)
                .put("addSource", COMMAND_ADD_SOURCE)
                .build();
    }

    private void fireCallback(int callbackId, WritableArray args) {
        WritableArray event = Arguments.createArray();
        event.pushInt(callbackId);
        event.pushArray(args);

        _context.getJSModule(RCTNativeAppEventEmitter.class)
                .emit("MapboxAndroidCallback", event);
    }

    @Override
    public void receiveCommand(ReactNativeMapboxGLView view, int commandId, @Nullable ReadableArray args) {
        Assertions.assertNotNull(args);
        switch (commandId) {
            case COMMAND_GET_DIRECTION:
                getDirection(view, args.getInt(0));
                break;
            case COMMAND_GET_PITCH:
                getPitch(view, args.getInt(0));
                break;
            case COMMAND_GET_CENTER_COORDINATE_ZOOM_LEVEL:
                getCenterCoordinateZoomLevel(view, args.getInt(0));
                break;
            case COMMAND_GET_BOUNDS:
                getBounds(view, args.getInt(0));
                break;
            case COMMAND_EASE_TO:
                easeTo(view, args.getMap(0), args.getBoolean(1), args.getInt(2));
                break;
            case COMMAND_SET_VISIBLE_COORDINATE_BOUNDS:
                setVisibleCoordinateBounds(view,
                        args.getDouble(0), args.getDouble(1), args.getDouble(2), args.getDouble(3),
                        args.getDouble(4), args.getDouble(5), args.getDouble(6), args.getDouble(7),
                        args.getBoolean(8)
                );
                break;
            case COMMAND_SELECT_ANNOTATION:
                selectAnnotation(view, args.getString(0), args.getBoolean(1));
                break;
            case COMMAND_SPLICE_ANNOTATIONS:
                spliceAnnotations(view, args.getBoolean(0), args.getArray(1), args.getArray(2));
                break;
            case COMMAND_QUERY_RENDERED_FEATURES:
                queryRenderedFeatures(view, args.getMap(0), args.getInt(1));
                break;
            case COMMAND_ADD_LAYER:
                addLayer(view, args.getMap(0), args.getString(1), args.getInt(2));
                break;
            case COMMAND_ADD_SOURCE:
                addSource(view, args.getString(0), args.getMap(1), args.getBoolean(2), args.getInt(3));
                break;
            default:
                throw new JSApplicationIllegalArgumentException("Invalid commandId " + commandId + " sent to " + getClass().getSimpleName());
        }
    }

    // Getters

    private void getDirection(ReactNativeMapboxGLView view, int callbackId) {
        WritableArray result = Arguments.createArray();
        result.pushDouble(view.getCameraPosition().bearing);
        fireCallback(callbackId, result);
    }

    private void getPitch(ReactNativeMapboxGLView view, int callbackId) {
        WritableArray result = Arguments.createArray();
        result.pushDouble(view.getCameraPosition().tilt);
        fireCallback(callbackId, result);
    }

    private void getCenterCoordinateZoomLevel(ReactNativeMapboxGLView view, int callbackId) {
        CameraPosition camera = view.getCameraPosition();

        WritableArray args = Arguments.createArray();
        WritableMap result = Arguments.createMap();
        result.putDouble("latitude", camera.target.getLatitude());
        result.putDouble("longitude", camera.target.getLongitude());
        result.putDouble("zoomLevel", camera.zoom);
        args.pushMap(result);

        fireCallback(callbackId, args);
    }

    private void getBounds(ReactNativeMapboxGLView view, int callbackId) {
        LatLngBounds bounds = view.getBounds();

        WritableArray args = Arguments.createArray();
        WritableArray result = Arguments.createArray();
        result.pushDouble(bounds.getLatSouth());
        result.pushDouble(bounds.getLonWest());
        result.pushDouble(bounds.getLatNorth());
        result.pushDouble(bounds.getLonEast());
        args.pushArray(result);

        fireCallback(callbackId, args);
    }

    // Setters

    private void easeTo(ReactNativeMapboxGLView view, ReadableMap updates, boolean animated, int callbackId) {
        CameraPosition oldPosition = view.getCameraPosition();
        CameraPosition.Builder cameraBuilder = new CameraPosition.Builder(oldPosition);

        if (updates.hasKey("latitude") && updates.hasKey("longitude")) {
            cameraBuilder.target(new LatLng(updates.getDouble("latitude"), updates.getDouble("longitude")));
        }
        if (updates.hasKey("zoomLevel")) {
            cameraBuilder.zoom(updates.getDouble("zoomLevel"));
        }
        if (updates.hasKey("direction")) {
            cameraBuilder.bearing(updates.getDouble("direction"));
        }
        if (updates.hasKey("pitch")) {
            cameraBuilder.tilt(updates.getDouble("pitch"));
        }

        // I want lambdas :(
        class CallbackRunnable implements Runnable {
            int callbackId;
            ReactNativeMapboxGLManager manager;

            CallbackRunnable(ReactNativeMapboxGLManager manager, int callbackId) {
                this.callbackId = callbackId;
                this.manager = manager;
            }

            @Override
            public void run() {
                manager.fireCallback(callbackId, Arguments.createArray());
            }
        }

        int duration = animated ? MapboxConstants.ANIMATION_DURATION : 0;
        view.setCameraPosition(cameraBuilder.build(), duration, new CallbackRunnable(this, callbackId));
    }

    public void setCamera(
            ReactNativeMapboxGLView view,
            double latitude, double longitude,
            double altitude, double pitch, double direction,
            double duration) {
        throw new JSApplicationIllegalArgumentException("MapView.setCamera() is not supported on Android. If you're trying to change pitch, use MapView.easeTo()");
    }

    public void setVisibleCoordinateBounds(
            ReactNativeMapboxGLView view,
            double latS, double lonW, double latN, double lonE,
            double paddingTop, double paddingRight, double paddingBottom, double paddingLeft,
            boolean animated) {
        CameraUpdate update = CameraUpdateFactory.newLatLngBounds(
                new LatLngBounds.Builder()
                        .include(new LatLng(latS, lonW))
                        .include(new LatLng(latN, lonE))
                        .build(),
                (int) paddingLeft,
                (int) paddingTop,
                (int) paddingRight,
                (int) paddingBottom
        );
        view.setCameraUpdate(update, animated ? MapboxConstants.ANIMATION_DURATION : 0, null);
    }

    // Annotations

    public void spliceAnnotations(ReactNativeMapboxGLView view, boolean removeAll, ReadableArray itemsToRemove, ReadableArray itemsToAdd) {
        if (removeAll) {
            view.removeAllAnnotations();
        } else {
            int removeCount = itemsToRemove.size();
            for (int i = 0; i < removeCount; i++) {
                view.removeAnnotation(itemsToRemove.getString(i));
            }
        }

        int addCount = itemsToAdd.size();
        for (int i = 0; i < addCount; i++) {
            ReadableMap annotation = itemsToAdd.getMap(i);
            RNMGLAnnotationOptions annotationOptions = RNMGLAnnotationOptionsFactory.annotationOptionsFromJS(annotation, view.getContext());

            String name = annotation.getString("id");
            view.setAnnotation(name, annotationOptions);
        }
    }

    public void selectAnnotation(ReactNativeMapboxGLView view, String annotationId, boolean animated) {
        view.selectAnnotation(annotationId, animated);
    }

    // Runtime styling

    private Function functionize(ReadableMap map) {
        ReadableArray stops = map.getArray("stops");
        Function.Stop[] stopsArray = new Function.Stop[stops.size()];
        for (int i = 0; i < stops.size(); i++) {
            stopsArray[i] = Function.stop(
                (float)stops.getArray(i).getDouble(0),
                PropertyFactory.backgroundOpacity((float)stops.getArray(i).getDouble(1))
            );
        }
        return Function.zoom((float)map.getDouble("base"), stopsArray);
    }

    public void addLayer(ReactNativeMapboxGLView view, ReadableMap layerJson, String before, int callbackId) {
        WritableArray callbackArgs = Arguments.createArray();
        if (!layerJson.hasKey("type") || !layerJson.hasKey("id")) {
            callbackArgs.pushString("addLayer(): layer must have valid 'id' and 'type' attributes.");
            fireCallback(callbackId, callbackArgs);
            return;
        }

        String layerType = layerJson.getString("type");
        ReadableMap paintProperties = layerJson.getMap("paint");
        if (new String("background").equals(layerType)) {
            ArrayList<Property> properties = new ArrayList<Property>();
            if (paintProperties.hasKey("background-color") && paintProperties.getType("background-color") == ReadableType.String) {
                properties.add(PropertyFactory.backgroundColor(paintProperties.getString("background-color")));
            }
            if (paintProperties.hasKey("background-opacity") && paintProperties.getType("background-opacity") == ReadableType.Map) {
                properties.add(PropertyFactory.backgroundOpacity(functionize(paintProperties.getMap("background-opacity"))));
            }

            BackgroundLayer layer = new BackgroundLayer(layerJson.getString("id"))
                .withProperties(properties.toArray(new Property[0]));
            view.addLayer(layer, before);
        }
        else if (new String("circle").equals(layerType)) {
            if (!layerJson.hasKey("source")) {
                callbackArgs.pushString("addLayer(): circle layer must have a valid 'source' attribute.");
                fireCallback(callbackId, callbackArgs);
                return;
            }
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
            view.addLayer(layer, before);
        }
        else if (new String("symbol").equals(layerType)) {
            if (!layerJson.hasKey("source")) {
                callbackArgs.pushString("addLayer(): symbol layer must have a valid 'source' attribute.");
                fireCallback(callbackId, callbackArgs);
                return;
            }
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
                if (new String("=").equals(filterJson.getString(0))) {
                    layer.setFilter(Filter.eq(filterJson.getString(1), filterJson.getInt(2)));
                }
            }

            view.addLayer(layer, before);
        }

        callbackArgs.pushString(null); // push null error message
        fireCallback(callbackId, callbackArgs);
    }

    public void removeLayer() {

    }

    public void addSource(ReactNativeMapboxGLView view, String id, ReadableMap sourceJson, boolean dataIsUrl, int callbackId) {
        WritableArray callbackArgs = Arguments.createArray();
        if (!sourceJson.hasKey("type")) {
          callbackArgs.pushString("addSource(): source must have a valid 'type' attribute.");
          fireCallback(callbackId, callbackArgs);
          return;
        }

        String sourceType = sourceJson.getString("type");
        if (new String("geojson").equals(sourceType)) {
            if (!sourceJson.hasKey("data")) {
                callbackArgs.pushString("addSource(): source of type 'geojson' must have a valid 'data' attribute.");
                fireCallback(callbackId, callbackArgs);
                return;
            }
            if (dataIsUrl == false) {
                view.addSource(new GeoJsonSource(id, sourceJson.getString("data")));
            }
        }

        callbackArgs.pushString(null); // push null error message
        fireCallback(callbackId, callbackArgs);
    }

    public void removeSource() {

    }

    // Feature querying
    public void queryRenderedFeatures(ReactNativeMapboxGLView view, ReadableMap options, int callbackId) {
      WritableArray callbackArgs = Arguments.createArray();
      if ((!options.hasKey("point") && !options.hasKey("rect")) || (options.hasKey("point") && options.hasKey("rect"))) {
          callbackArgs.pushString("queryRenderedFeatures(): one of 'point' or 'rect' is required.");
          fireCallback(callbackId, callbackArgs);
          return;
      }

      String[]layers = null;
      if (options.hasKey("layers")) {
        ReadableArray layersArray = options.getArray("layers");
        layers = new String[layersArray.size()];
        for (int i = 0; i < layersArray.size(); i++) {
          String layerName = layersArray.getString(i);
          layers[i] = layerName;
        }
      }

      List<Feature> featuresList = null;
      if (options.hasKey("point")) {
        ReadableMap pointMap = options.getMap("point");
        float screenCoordX = (float)pointMap.getDouble("screenCoordX");
        float screenCoordY = (float)pointMap.getDouble("screenCoordY");
        PointF point = new PointF(screenCoordX, screenCoordY);
        featuresList = view.queryRenderedFeatures(point, layers);
      } else {
        ReadableMap rectMap = options.getMap("rect");
        float left = (float)rectMap.getDouble("left");
        float top = (float)rectMap.getDouble("top");
        float right = (float)rectMap.getDouble("right");
        float bottom = (float)rectMap.getDouble("bottom");
        RectF rect = new RectF(left, top, right, bottom);
        featuresList = view.queryRenderedFeatures(rect, layers);
      }

      WritableArray jsonFeatures = Arguments.createArray();
      for (int i = 0; i < featuresList.size(); i++) {
        Feature feature = featuresList.get(i);
        jsonFeatures.pushString(feature.toJson());
      }

      callbackArgs.pushString(null); // push null error message
      callbackArgs.pushArray(jsonFeatures); // second arg is features GeoJSON
      fireCallback(callbackId, callbackArgs);
    }
}
