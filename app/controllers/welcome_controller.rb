class WelcomeController < ApplicationController
    def home
        redirect_to events_path if logged_in?
    end
end