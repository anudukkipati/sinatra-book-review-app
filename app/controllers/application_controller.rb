require './config/environment'

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

end
