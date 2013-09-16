require 'spec_helper'

describe Cart do
  it "returns a collection of cart_items" do
    product = Product.create(title: 'T-Shirt', description: 'Brand new red t-shirt', price: 7.99)
    current_cart = Cart.create
    current_cart.cart_items.build(product: product)
    expect(current_cart.cart_items.first.product_id).to be product.id
    expect(current_cart.cart_items.first.cart_id).to be current_cart.id
  end

  it "responds to #products" do
    current_cart = Cart.create
    current_cart.should respond_to(:products)
  end
end
