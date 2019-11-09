class ReviewsController < ApplicationController
    get '/reviews' do
      @reviews = Review.all 
      erb :'/reviews/index.html'
    end

    get '/reviews/new' do
      @museums = Museum.all
      erb :'/reviews/new.html'
    end

    get '/reviews/:id' do
      erb :'/reviews/show.html'
    end

    post '/reviews' do
      @review = Review.create(museum_id: params[:museum_id], title: params[:title], date_visited: params[:date_visited], content: params[:content])
      @review.save
      redirect to "reviews/#{@review.id}"
    end

    get '/reviews/:id' do
      erb :'/reviews/show.html'
    end
end