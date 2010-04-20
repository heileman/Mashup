class LocationsController < ApplicationController
  
  def index
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([49.32126886821149, -124.31490540504456],12)
    @map.overlay_init(GMarker.new([49.32126886821149, -124.31490540504456],
    :title => "Title", 
    :info_window => "<h1>Info Window title</h1><p>text or html can go here</p>"))
  end
  
end
