class ReviewpagesController < ApplicationController
    get '/reviewpages' do
      @reviewpages = Reviewpage.visible
      erb :'reviewpages/index.html'
    end

    get '/reviewpages/new' do
      erb :'reviewpages/new.html'
    end

    get '/reviewpages/:id' do
      @reviewpage = Reviewpage.find(params[:id])
      erb :'reviewpages/show.html'
    end

    post '/reviewpages' do
      redirect_if_not_logged_in
      @reviewpage = Reviewpage.create(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
      redirect "/reviewpages/#{@reviewpage.id}"
    end

    get '/reviewpages/:id/edit' do
      @reviewpage = Reviewpage.find(params[:id])
      erb :"reviewpages/edit.html"
    end

    patch '/reviewpages/:id' do
      @reviewpage = Reviewpage.find_by_id(params[:id])
      redirect "/reviewpages" unless @reviewpage
      if @reviewpage.update(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
        redirect "/reviewpages/#{@reviewpage.id}"
      else
        @error = "Unable to save review due to the following error(s): #{@reviewpage.errors.full_messages.to_sentence}"
        erb :"reviewpages/edit.html"
      end
    end

    delete '/reviewpages/:id' do
      @reviewpage = Reviewpage.find_by_id(params[:id])
      redirect "/reviewpages" unless @reviewpage
      @reviewpage.update(deleted: true)
      redirect "/reviewpages"
    end

end