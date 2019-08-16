class WelcomeController < ApplicationController

    def home
        redirect_to contacts_url if logged_in?
    end 

    def about
        # Note: render :about is unnecessary. By default rails tries to be helpful 
        # so if nothing is written, it will automatically do a render :about. 
        # I prefer to explicitly write it
        render :about
    end 

end 