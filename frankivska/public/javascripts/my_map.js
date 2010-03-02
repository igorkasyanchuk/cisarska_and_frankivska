
function initialize_map_with_xy(xxx, yyy) {
  if (GBrowserIsCompatible()) {
    map = new GMap2(document.getElementById("map_canvas"));
    map.setUIToDefault();
    map.removeMapType(G_SATELLITE_MAP);
    map.removeMapType(G_PHYSICAL_MAP);
    map.setCenter(new GLatLng(xxx, yyy), 12);
    var marker = new GMarker(new GLatLng(xxx, yyy));
    map.addOverlay(marker);
    geocoder = new GClientGeocoder(); 
  }  
}