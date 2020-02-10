class BookReviewsController < ApplicationController

    get '/book_reviews' do
       # redirect_if_not_logged_in
        @book_reviews = BookReview.all
        erb :'/book_reviews/index'
    end

    get '/book_reviews/new' do 
        redirect_if_not_logged_in
          erb :'/book_reviews/new'    
    end

    post '/book_reviews' do
        redirect_if_not_logged_in
           if params[:title] && params[:image] && params[:content] != ""
              @book_review = BookReview.create(title: params[:title], image: params[:image], content: params[:content], user_id: current_user.id)
              flash[:message] = "Book Review successully created." if @book_review.id
              redirect "/book_reviews/#{@book_review.id}"
           else
              flash[:errors] = "Something went wrong - all fields should be filled."
              redirect '/book_reviews/new'
           end
     end

     get '/book_reviews/:id' do
        @book_review = BookReview.find_by(id: params[:id])
        erb :'/book_reviews/show'
     end
     

     get '/book_reviews/:id/edit' do 
        redirect_if_not_logged_in
        @book_review = BookReview.find_by(id: params[:id])
        if @book_review.user == current_user 
           erb :'/book_reviews/edit'
        else
           redirect '/book_reviews'
        end
        
     end

     patch '/book_reviews/:id' do 
       redirect_if_not_logged_in
       @book_review = BookReview.find_by(id: params[:id])
       if @book_review.user == current_user && params[:title] && params[:image] && params[:content] != ""
         @book_review.update(title: params[:title], image: params[:image],content: params[:content])
         redirect "/book_reviews/#{@book_review.id}"
       else
         redirect '/book_reviews'
       end
     end

     delete '/book_reviews/:id' do 
        @book_review = BookReview.find_by(id: params[:id])
        if @book_review.user == current_user
           @book_review.destroy
           flash[:message] = "Successfully deleted that Book Review."
           redirect '/book_reviews'
         else
            redirect '/book_reviews'
         end
     end
end