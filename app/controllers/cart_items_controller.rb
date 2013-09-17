class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    current_cart.cart_items.create(:product => product)
    redirect_to root_path
  end


  def destroy
    cart_item = CartItem.find(params[:id]).destroy
    redirect_to cart_path(current_cart)
  end
end