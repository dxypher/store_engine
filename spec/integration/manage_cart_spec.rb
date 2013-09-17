require 'spec_helper'

feature 'Add product to cart' do
  scenario 'user adds a product to their cart' do
    product = Product.create(title: 'T-Shirt', description: 'Brand new red t-shirt', price: 7.99)

    visit root_path
    click_link 'Add to Cart'
    expect(page).to have_css 'p', text: 'Items in Cart: 1'
  end
end

feature 'View cart' do
  scenario 'user should see a link for their cart' do
    visit root_path
    expect(page).to have_css 'a', text: 'Cart'
  end

  scenario 'user should be able to click cart link and see cart contents' do
    product = Product.create(title: 'T-Shirt', description: 'Brand new red t-shirt', price: 7.99)

    visit root_path
    click_link 'Add to Cart'

    click_link 'Cart'
    expect(page).to have_css 'li', text: 'T-Shirt'
    expect(page).to have_css 'li', text: 'Brand new red t-shirt'
    expect(page).to have_css 'li', text: 'Price: $7.99'
  end
end

feature 'Remove item from cart' do
  scenario 'user should see remove link' do
    product = Product.create(title: 'T-Shirt', description: 'Brand new red t-shirt', price: 7.99)

    visit root_path
    click_link 'Add to Cart'
    click_link 'Cart'
    expect(page).to have_css 'a', text: "remove"
  end

  scenario 'user should be able to remove an item from the cart' do
    product = Product.create(title: 'T-Shirt', description: 'Brand new red t-shirt', price: 7.99)

    visit root_path
    click_link 'Add to Cart'
    click_link 'Cart'
    click_link 'remove'

    expect(page).not_to have_css 'li', text: 'Brand new red t-shirt'
  end
end