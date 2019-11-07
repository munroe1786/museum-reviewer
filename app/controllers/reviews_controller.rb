class ReviewsController < ApplicationController
    get '/reviews' do
      @review = Review.all 
      erb :'/reviews/index.html'
    end
end