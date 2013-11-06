class Category < ActiveRecord::Base
  attr_accessible :category_name
  belongs_to :product
end
