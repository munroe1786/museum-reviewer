class ReviewpagesController < ApplicationController
    get '/reviewpages' do
      @reviewpages = Reviewpage.all
      erb :'/reviewpages/index.html'
    end

    get '/reviewpages/new' do
      erb :'/reviewpages/new.html'
    end

    get '/reviewpages/:id' do
      @reviewpage = Reviewpage.find(params[:id])
      erb :'/reviewpages/show.html'
    end

    post '/reviewpages' do
      @reviewpage = Reviewpage.create(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
      #@reviewpage.save
      #binding.pry
      #redirect "reviewpages/#{@reviewpage.id}"
      redirect "/reviewpages"
    end

end