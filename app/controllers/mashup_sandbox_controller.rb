class MashupSandboxController < ApplicationController

  def index
    # This creates the map object, which will be placed inside a DIV with id "map_div"
    @map = GMap.new("map")
    
    @locations = Location.find(:all)
    
    #geocode the locations
    @locations.each do |location|
        loc = MultiGeocoder.geocode(location.address)
        Location.update(location.id, :lat => loc.lat, :lng => loc.lng)
        puts "Updated location #{location.address} => [#{loc.lat}, #{loc.lng}]"
    end
    
    # This adds controls to the map, in this case, a large zoom slider and pan across, as 
    # well as a map type selector
    @map.control_init(:large_map => true, :map_type => true)
    
    # Center and zoom the map at coordinates provided by first parameter, and zoom level 
    # provided by second paramter (second parameter is in [1,16] )
    @map.center_zoom_init([35.0830078, -106.6488646], 12)
    
    # Define the start and end icons  
    blue_icon =  GIcon.new(:image => "http://maps.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png", 
      :icon_size => GSize.new(32.0,32.0), 
      :icon_anchor => GPoint.new(16.0,16.0), 
      :info_window_anchor => GPoint.new(32.0,32.0))  
    red_icon = GIcon.new(:image => "http://maps.google.com/intl/en_us/mapfiles/ms/micons/red-dot.png", 
      :icon_size => GSize.new(32.0,32.0), 
      :icon_anchor => GPoint.new(16.0,16.0), 
      :info_window_anchor => GPoint.new(32.0,32.0)) 
   
    @locations.each do |location|
      if location.locatable_type == 'BluePerson' 
        blue_person = BluePerson.find(location.locatable_id)
        @map.overlay_init(GMarker.new([location.lat, location.lng],
          :icon => blue_icon,
          :title => blue_person.name, 
          :info_window => "<b>#{blue_person.name}</b><br> #{location.address}"))
      end
      if location.locatable_type == 'RedPerson' 
        red_person = RedPerson.find(location.locatable_id)
        @map.overlay_init(GMarker.new([location.lat, location.lng],
          :icon => red_icon,
          :title => red_person.name, 
          :info_window => "<b>#{red_person.name}</b><br> #{location.address}<br> Information: #{red_person.description}"))
      end
    end
  end
	
end