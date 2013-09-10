class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    current_cart.cart_items.create(:product => product)
    redirect_to root_path
  end
end