require 'rails_helper'

feature 'Creation' do
  scenario 'It should test if I can create a new car' do
    visit '/'

    click_button 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'
    click_button 'Submit'

    page.has_content?('1967 Ford Mustang added to the Database')
  end
  scenario 'This test should check to see if all cars can be listed' do
    visit 'cars'
    expect find_button('New Car').visible?
  end
end
describe 'Creating a car', :type => :feature do
  before :each do
    @c = Car.create(make: 'Honda', model: 'Civic', year:'2004', price: '5000')
  end
  it 'Tests to see if a new car can be saved' do
    visit 'cars/new'
    fill_in "Make", :with => 'Honda'
    click_button 'Submit'
    page.has_content?('added to Database')
  end
end
