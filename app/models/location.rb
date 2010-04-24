require 'geokit-rails'
include GeoKit::Geocoders

class Location < ActiveRecord::Base
  acts_as_mappable  
end
