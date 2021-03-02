require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'login and logout', type: :feature do
  let(:user) { User.create(name: 'Nkiruka', password: 'helloworld') }

  scenario 'login' do
    visit login_path
    fill_in 'session_name', with: user.name
    click_button 'Login'
    sleep(3)
    expect(page).to have_content('Login')
  end
end

RSpec.describe 'Login fields', type: :feature do
  describe 'fields in login page' do
    it 'name field in login page' do
      visit login_path
      expect(page).to have_content 'Name'
    end
  end
end
