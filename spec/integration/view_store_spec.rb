require 'spec_helper'

feature 'View the store' do
  scenario 'user sees relevant information' do
    visit root_path
    expect(page).to have_css('title'), text: 'store engine'
  end
end