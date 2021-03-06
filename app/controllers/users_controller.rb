class UsersController < ApplicationController
    
    get '/login' do
       
        erb :'/users/login'
    end
    
    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id

           flash[:message] = "Welcome, #{@user.username}"
           redirect '/book_reviews'

        else
           flash[:errors] = "Invalid Credentials. Please Sign Up or Try Again!"
           redirect '/login'
        end

      end

      get '/signup' do
        erb :'/users/signup'
     end

     post '/signup' do
      
      @user = User.new(username: params[:username], email: params[:email],  password: params[:password])  #password: validating_user(params)
      
      if @user.save
        session[:user_id] = @user.id
        flash[:message] = "You have sucessfully created an account, #{@user.username}!, Please Log In to continue."
        redirect '/login'
      else
         flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
          redirect '/signup'
      end
     end

     get '/users/:id' do
       @user = User.find_by(id: params[:id])
      
       redirect_if_not_logged_in
       erb :'/users/show'
     end

     get '/logout' do
        session.clear
        redirect '/'
      end

      private

# def validating_user(params)
#   if params[:password] != "password"
#      params[:password]
#   else
#     nil
#   end
#  end
end

