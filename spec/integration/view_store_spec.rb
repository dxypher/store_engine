require 'spec_helper'

feature 'View the store' do
  scenario 'user sees relevant information' do
    visit root_path
    expect(page).to have_css 'title', text: 'StoreEngine'
  end

  scenario 'user sees all products' do
    product = Product.create(title: 'T-Shirt', description: 'Brand new red t-shirt', price: 7.99)
    visit root_path
    expect(page).to have_css 'li', text: "Title: #{product.title}"
    expect(page).to have_css 'li', text: "Description: #{product.description}"
    expect(page).to have_css 'li', text: "Price: #{product.price}"
  end
end

feature 'Filter items by category' do
  scenario 'user can browse products by category' do
    t_shirts = Category.create(title: 't_shirts')
    jeans = Category.create(title: 'jeans')
    red_shirt = t_shirts.products.create(title: 'Red T', description: 'Brand new red t-shirt', price: 7.99)
    blue_jeans = jeans.products.create(title: 'Levis Jeans', description: 'Boot Cut Blue Jeans', price: 27.99)

    visit root_path
    click_link 'Jeans'
    expect(page).to have_css 'li', text: "Description: #{blue_jeans.description}"
    expect(page).not_to have_css 'li', text: "Description: #{red_shirt.description}"
  end
end