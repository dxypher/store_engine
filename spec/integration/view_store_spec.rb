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