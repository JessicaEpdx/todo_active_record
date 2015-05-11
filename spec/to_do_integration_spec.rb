require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('path of list form', {:type => :feature}) do
  it('allows user to enter new list, sends user to task page') do
    visit('/')
    fill_in('name', :with => 'Work Stuff')
    click_button('Add List')
    expect(page).to have_content('Work Stuff')
  end
end
