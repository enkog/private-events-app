require 'rails_helper'
require 'capybara/rspec'
RSpec.describe EventsController, type: :controller do
  context 'GET events controller views' do
    before(:each) do
      @user = User.new(id: '1', name: 'nkiruka', password: 'hello').save
      @event = Event.new(id: '1', title: 'Micronaut MeetnGreet', description: 'This is a meet and greet', location: 'zoom', date: DateTime.now, creator_id: '1').save
    end

    it 'GET #index' do
      get :index
      expect(response).to be_successful
    end

    it 'GET #show' do
      get :show, params: { id: '1' }
      expect(response).to be_successful
    end
  end

  context 'Create an event' do
    it 'should create a new event' do
      @user = User.new(id: '1', name: 'nkiruka', password: 'hello').save
      @event = Event.new(id: '1', title: 'Micronaut MeetnGreet', description: 'This is a meet and greet', location: 'zoom', date: DateTime.now, creator_id: '1').save
      expect(@event).to eq(true)
    end
  end

  context 'Attend an event' do
    it 'should create attendance for an event' do
      @user = User.new(id: '1', name: 'nkiruka', password: 'hello').save
      @event = Event.new(id: '1', title: 'Micronaut MeetnGreet', description: 'This is a meet and greet', location: 'zoom', date: DateTime.now, creator_id: '1').save
      @attend = EventUser.new(user_id: '1', event_id: '1')
      expect(@attend.save).to eq(true)
    end
  end
end

RSpec.describe 'Event Management', type: :feature do
  let(:user) { User.create(id: '1', name: 'nkiruka', password: 'hello') }
  let(:event) { Event.create(id: '1', title: 'Micronaut MeetnGreet', description: 'This is a meet and greet', location: 'zoom', date: DateTime.now, creator_id: '1') }
  before(:each) do
    visit login_path
    fill_in 'Name', with: 'nkiruka'
    click_button 'Login'
  end
end
