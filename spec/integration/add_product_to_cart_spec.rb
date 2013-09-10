require 'spec_helper'

feature 'Add product to cart' do
  scenario 'user adds a product to their cart' do
    product = Product.create(title: 'T-Shirt', description: 'Brand new red t-shirt', price: 7.99)

    visit root_path
    click_link 'Add to Cart'
    expect(page).to have_css 'p', text: 'Items in Cart: 1'
  end
end