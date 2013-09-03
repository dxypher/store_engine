require 'spec_helper'

describe Category, 'product' do
  it "has an association with Products" do
    category = Category.new(title: 'jeans')
    category.should respond_to :products
  end
end
