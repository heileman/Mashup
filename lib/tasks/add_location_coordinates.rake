namespace :Location do
  desc 'Update locations with longitude and latitude data'
  task :add_location_coordinates => :environment do
    include GeoKit::Geocoders
    
    locations = Location.find(:all)
    begin
      locations.each { |location|
        loc = MultiGeocoder.geocode(location.address)
        Location.update(location.id, :lat => loc.lat, :lng => loc.lng)
        puts "Updated location #{location.address} => [#{loc.lat}, #{loc.lng}]"
      }
      rescue
      puts $!
    end
  end
end
