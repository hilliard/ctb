class Product < ActiveRecord::Base
  attr_accessible :displayname, :description, :location, :model, :vendor, :supplier, :cost, :value, :condition, :status, :category,
                  :color, :uom, :user_id, :quantity, :acquired, :retired, :note, :image_url
  validates  :displayname, :description, :location, :cost, :condition, :status, :quantity, :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :displayname, :uniqueness => true
  validates :image_url, :format => {
      :with => %r{\.(gif|jpg|png)$}i,
      :message => 'must be a URL for GIF, JPG or PNG image.'
      }
  belongs_to :user
  has_many   :locations
  has_many   :conditions
end
