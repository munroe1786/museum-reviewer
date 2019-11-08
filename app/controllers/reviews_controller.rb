class ReviewsController < ApplicationController
    get '/reviews' do
      @reviews = Review.all 
      erb :'/reviews/index.html'
    end

    get '/reviews/new' do
      @musuems = Museum.all
      erb :'/reviews/new.html'
    end

    post '/reviews/new' do

    end
end