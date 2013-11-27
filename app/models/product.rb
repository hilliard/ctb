class Product < ActiveRecord::Base
  default_scope :order => 'displayname'
  has_many :line_items
  has_many :orders, :through => :line_items
  # has_many   :locations
  # has_many   :conditions
  # has_many   :statuses
  # has_many   :categories


  attr_accessible :displayname, :description, :location, :model, :vendor, :supplier, :cost, :value, :condition, :status, :category,
                  :color, :uom, :user_id, :quantity, :acquired, :retired, :note, :image_url
  validates  :displayname, :description, :location, :cost, :condition, :quantity, :status,  :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :displayname, :uniqueness => true
  validates :image_url, allow_blank: true, format: {
      with:    %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }



  before_destroy :ensure_not_referenced_by_any_line_item

  #ensure there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  def self.latest
    Product.order(:updated_at).last
  end
end
