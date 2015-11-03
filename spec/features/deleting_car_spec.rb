require 'rails_helper'

describe 'deleting cars', :type => :feature do
  before :each do
    @c = Car.create(make: 'Honda', model: 'Civic', year: '2004', price: '5000')
  end
  it 'deletes a car on the specific car page' do
    visit "cars/#{@c.id}"
    click_button('Destroy')
    page.has_content?('was destroyed.')
  end
  scenario 'destroy a car on the home page' do
    visit '/'
    expect find_button("Destroy").click
  end
end

