class WelcomeController < ApplicationController
  def home
    redirect_to events_path if current_user
  end
end
