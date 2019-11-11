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
      @page_title = @reviewpage.museum_name
      erb :'/reviewpages/show.html'
    end

    post '/reviewpages' do
      redirect_if_not_logged_in
      @reviewpage = Reviewpage.create(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
      redirect "reviewpages/#{@reviewpage.id}"
    end

    get '/reviewpages/:id/edit' do
      @reviewpage = Reviewpage.find(params[:id])
      @page_title = "Edit #{@reviewpage.museum_name}"
      erb :"reviewpages/edit.html"
    end

end