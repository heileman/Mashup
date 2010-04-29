class MashupController < ApplicationController

  def index
    # This creates the map object, which will be placed inside a DIV with id "map_div"
    @map = GMap.new("map")
    
    # This adds controls to the map, in this case, a large zoom slider and pan across, as 
    # well as a map type selector
    @map.control_init(:large_map => true, :map_type => true)
    
    # Center and zoom the map at coordinates provided by first parameter, and zoom level 
    # provided by second paramter (second parameter is in [1,16] )
    @map.center_zoom_init([35.0830078, -106.6488646], 12)
    
    # This adds a marker to the map
    @map.overlay_init(GMarker.new([35.0230078, -106.6488646],
    :title => "one", 
    :info_window => "<h1>Info Window title</h1><p>text or html can go here</p>"))
  end

  def indexold
    # This creates the map object, which will be placed inside a DIV with id "map_div"
    @map = GMap.new("map")
    
    @locations = Location.find(:all)
    
    # This adds controls to the map, in this case, a large zoom slider and pan across, as 
    # well as a map type selector
    @map.control_init(:large_map => true, :map_type => true)
    
    # Center and zoom the map at coordinates provided by first parameter, and zoom level 
    # provided by second paramter (second parameter is in [1,16] )
    @map.center_zoom_init([35.0830078, -106.6488646], 12)
    
    # This adds a marker to the map
    @map.overlay_init(GMarker.new([35.0230078, -106.6488646],
    :title => "one", 
    :info_window => "<h1>Info Window title</h1><p>text or html can go here</p>"))
    
    @locations.each do |location|
      if location.locatable_type == 'BluePerson' 
        blue_person = BluePerson.find(location.locatable_id)
        @map.overlay_init(GMarker.new([location.lat, location.lng],
          :image => "http://www.goggle.com/mapfiles/ms/icons/blue-pushpin.png",
          :title => blue_person.name, 
          :info_window => location.address))
      end
      if location.locatable_type == 'RedPerson' 
        red_person = RedPerson.find(location.locatable_id)
        @map.overlay_init(GMarker.new([location.lat, location.lng],
          :title => location.address, 
          :info_window => red_person.description))
      end
    end
  end
	
end