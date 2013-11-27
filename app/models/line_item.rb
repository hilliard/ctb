class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :product, :quantity, :displayname
  validates :product_id, presence: true
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
    product.cost * quantity
  end


end
