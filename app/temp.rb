class LocationsController < ApplicationController
  
  def index
    # This creates the map object, which will be placed inside a DIV with id "map_div"
    @map = GMap.new("map_div")
    
    # This adds controls to the map, in this case, a large zoom slider and pan across, as 
    # well as a map type selector
    @map.control_init(:large_map => true, :map_type => true)
    
    # Center and zoom the map at coordinates provided by first parameter, and zoom level 
    # provided by second paramter (second parameter is in [1,16] )
    @map.center_zoom_init([35.0830078, -106.6488646], 12)
    
    @map.overlay_init(GMarker.new([49.32126886821149, -124.31490540504456],
    :title => "Title", 
    :info_window => "<h1>Info Window title</h1><p>text or html can go here</p>"))
  end
  
end


function addMarker(latitude, longitude, id) {
    var marker = new GMarker(new GLatLng(latitude, longitude));
    
    GEvent.addListener(marker, 'click', 
        function() { 
            focusPoint(id); 
        }
    );
    
    map.addOverlay(marker);
    return marker;
}