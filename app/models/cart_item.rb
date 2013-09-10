class CartItem < ActiveRecord::Base
  attr_accessible :product
  belongs_to :cart
  belongs_to :product
end