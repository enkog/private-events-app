require 'rails_helper'
require 'capybara/rspec'

RSpec.describe UsersController, type: :controller do
  context 'GET users controller views' do
    it 'GET #index' do
      get :index
      expect(response).to be_successful
    end

    it 'GET #show' do
      @user = User.new(id: '1', name: 'nkiruka', password: 'helloworld').save
      get :show, params: { id: '1' }
      expect(response).to be_successful
    end

    it 'GET #new/sign up page' do
      get :new
      expect(response).to be_successful
    end
  end

  context 'Create user' do
    it 'should create a user' do
      @user = User.new(id: '1', name: 'nkiruka', password: 'helloworld')
      expect(@user.save).to eq(true)
    end
  end
end

RSpec.describe 'Sign up fields', type: :feature do
  describe 'fields in sign up page' do
    it 'name field in signup page' do
      visit new_user_path
      expect(page).to have_content 'Name'
    end
    it 'password field in signup page' do
      visit new_user_path
      expect(page).to have_content 'Password'
    end
  end
end

RSpec.describe 'create user and redirect to user show page', type: :feature do
  let(:user) { User.create(name: 'Nkiruka', password: 'helloworld') }

  scenario 'create user' do
    visit new_user_path
    fill_in 'Name', with: 'Nkiruka'
    fill_in 'Password', with: 'helloworld'
    click_button 'Signup'
    visit users_path
    expect(page).to have_content("Nkiruka")
  end
end