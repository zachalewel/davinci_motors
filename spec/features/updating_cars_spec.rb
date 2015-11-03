require 'rails_helper'

feature 'Tests layout of edit table' do
  scenario 'Tests for functionality- edit a car with the submit button' do
    Car.create
    visit 'cars/1/edit'
    expect find_button('Submit').click
  end
end
describe "The update process", :type => :feature do
  before :each do
    @c = Car.create(make: 'nissian', model: 'sentra', year: '1997', price: '2000')
  end

  it 'tests each step of the update process' do
    visit "cars/#{@c.id}/edit"
    fill_in "Make", :with => 'nissan'
    click_button 'Submit'
    page.has_content?('Was successfully updated!')
  end
end
