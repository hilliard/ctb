class Product < ActiveRecord::Base
  attr_accessible :displayname, :description, :location, :model, :vendor, :supplier, :cost, :value, :condition, :status, :category,
                  :color, :uom, :user_id, :quantity, :acquired, :retired, :note, :image_url
  belongs_to :user
  has_many   :locations
  has_many   :conditions
end
