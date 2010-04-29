class BluePerson < ActiveRecord::Base
  has_one :location, :as => :locatable  # establish polymorphic association 
  acts_as_mappable :through => :location  # make location-based queries and find methods available
end
