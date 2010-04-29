require 'geokit-rails'
include GeoKit::Geocoders

class Location < ActiveRecord::Base
  belongs_to :locatable, :polymorphic => true   # allow polymorphic associations
  acts_as_mappable  # make location-based queries and find methods available
end
  