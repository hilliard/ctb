class Status < ActiveRecord::Base
  attr_accessible :status_name
  belongs_to :product
end
