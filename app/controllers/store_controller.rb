class StoreController < ApplicationController
  include Current_Cart
    before_action :set_cart

  def index
    increment_counter
    @products = Product.order(:displayname)
  end

  def increment_counter
    if session[:counter].nil?
       session[:counter] = 0
    end
       session[:counter] += 1
  end
end
