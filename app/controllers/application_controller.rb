#require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_sinatra_book_review_project"
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end
  
  helpers do 
 
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    #true if user is logged in, otherwise false
    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to view the page you tried to view."
        redirect '/'
      end
    end
    
    def redirect_if_logged_in
      if logged_in?
        redirect "/book_reviews"
      end
    end
   end
end
