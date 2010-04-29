class SandboxController < ActionController::Base
  
  include GeoKit::Geocoders

  def lookup_geocodes
    places = [
      {:address=>'555 Irving, San Francisco, CA',:description=>'Irving'},
      {:address=>'1401 Valencia St, San Francisco, CA',:description=>'Valencia'},
      {:address=>'501 Cole St, San Francisco, CA',:description=>'Cole'},
      {:address=>'150 Church St, San Francisco, CA',:description=>'Church'} 
     ]

    # this loop will do the geo lookup for each place
    places.each do |place|
      # get the geocode by calling our own get_geocode(address) method
      geocode = get_geocode place[:address]
      
      # geo_code is now a hash with keys :latitude and :longitude
      # place these values back into our "database" (array of hashes)
      place[:latitude]=geocode[:latitude]
      place[:longitude]=geocode[:longitude]    
    
    end
    
    #place the result in the session so we can use it for display
    session[:places] = places
    
    #let the user know the lookup went ok
    render :text=> 'Looked up the geocodes for '+ places.length.to_s + ' address and stored the result in the session . . .'
  
  end

  def show_google_map
    # all we're going to do is loop through the @places array on the page
    @places=session[:places]
  end
  
  private
  def get_geocode(address)
    logger.debug 'starting geocoder call for address: ' + address
    # this is where we call the geocoding web service
    result = MultiGeocoder.geocode(address)
    logger.debug "Geocode call: " + result.inspect
    
    return {:success=> true, :latitude => result.lat, :longitude => result.lng}
  end  
  

end