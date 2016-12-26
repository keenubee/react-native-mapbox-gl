'use strict';

const fs = require('fs');
const ejs = require('ejs');
const spec = require('mapbox-gl-style-spec').latest;
const overrides = require('./style-spec-cocoa-conventions-v8')

// Specification parsing //

// Collect layer types from spec
const layers = Object.keys(spec.layer.type.values).filter((type) => type !== 'fill-extrusion').map((type) => {
  const layoutProperties = Object.keys(spec[`layout_${type}`]).reduce((memo, name) => {
    if (name !== 'visibility') {
      spec[`layout_${type}`][name].name = name;
      spec[`layout_${type}`][name].propertyType = 'layout';
      spec[`layout_${type}`][name].setterName = overrides[`layout_${type}`] && overrides[`layout_${type}`][name] && overrides[`layout_${type}`][name].replace(/^is-/, '');
      memo.push(spec[`layout_${type}`][name]);
    }
    return memo;
  }, []);

  const paintProperties = Object.keys(spec[`paint_${type}`]).reduce((memo, name) => {
    spec[`paint_${type}`][name].name = name;
    spec[`paint_${type}`][name].propertyType = 'paint';
    spec[`paint_${type}`][name].setterName = overrides[`paint_${type}`] && overrides[`paint_${type}`][name] && overrides[`paint_${type}`][name].replace(/^is-/, '');
    memo.push(spec[`paint_${type}`][name]);
    return memo;
  }, []);

  return {
    type: type,
    doc: spec.layer.type.values[type].doc,
    layoutProperties: layoutProperties,
    paintProperties: paintProperties,
    properties: layoutProperties.concat(paintProperties)
  };
});

// const layerFactoryJava = ejs.compile(fs.readFileSync('../android/src/main/java/com/mapbox/reactnativemapboxgl/rnmgl-layer-factory.java.ejs', 'utf8'), {strict: true});
const mglStyleLayer = ejs.compile(fs.readFileSync('../ios/RCTMapboxGL/mglstylelayer-rctadditions.m.ejs', 'utf8'), {strict: true});
// fs.writeFileSync('../android/src/main/java/com/mapbox/reactnativemapboxgl/RNMGLLayerFactory.java', layerFactoryJava({layers: layers}), 'utf8');
fs.writeFileSync('../ios/RCTMapboxGL/MGLStyleLayer+RCTAdditions.m', mglStyleLayer({layers: layers}), 'utf8');
