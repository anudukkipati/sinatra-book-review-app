class BookReviewsController < ApplicationController

    get '/book_reviews' do
        @book_reviews = BookReview.all
        erb :'/book_reviews/index'
    end
end