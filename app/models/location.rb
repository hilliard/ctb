class Location < ActiveRecord::Base
  attr_accessible :location_name

  belongs_to :product
end
