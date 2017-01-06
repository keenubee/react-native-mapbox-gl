package com.mapbox.mapboxsdk.style.layers;

/**
 * Thrown when adding a layer to a map twice
 */
public class InvalidLayerException extends RuntimeException {

  public InvalidLayerException(String message) {
    super(message);
  }

}
