class Order < ActiveRecord::Base
  attr_accessible :name, :email, :address, :pay_type
  has_many :line_items, :dependent => :destroy
  has_one :pay_type
  # PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]

  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :presence => true

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end


end