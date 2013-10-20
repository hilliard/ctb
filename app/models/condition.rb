class Condition < ActiveRecord::Base
  attr_accessible :condition_name
  belongs_to :product
end
