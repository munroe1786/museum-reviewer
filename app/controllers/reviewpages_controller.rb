class ReviewpagesController < ApplicationController
    get '/reviewpages' do
      @reviewpages = Reviewpage.visible
      erb :'reviewpages/index.html'
    end

    get '/reviewpages/new' do
      erb :'reviewpages/new.html'
    end

    get '/reviewpages/:id' do
      redirect_if_not_logged_in
      @reviewpage = Reviewpage.find(params[:id])
      erb :'reviewpages/show.html'
    end

    post '/reviewpages' do
      redirect_if_not_logged_in
      @reviewpage = current_user.reviewpages.new(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
      if !params[:museum_name].empty? && !params[:location].empty? && !params[:date_visited].empty? && !params[:content].empty?
        @reviewpage.save
        @reviewpage
        flash[:success] = "Review created successfully"
        redirect "/reviewpages/#{@reviewpage.id}"
      else
        flash[:error] = "Please fill out all fields"
        redirect "/reviewpages"
      end
    end

    get '/reviewpages/:id/edit' do
      redirect_if_not_logged_in
      @reviewpage = Reviewpage.find_by_id(params[:id])
      authorize_user_for(@reviewpage)
      erb :"reviewpages/edit.html"
    end

    patch '/reviewpages/:id' do
      redirect_if_not_logged_in
      @reviewpage = Reviewpage.find_by_id(params[:id])
      redirect "/reviewpages" unless @reviewpage
      authorize_user_for(@reviewpage)
      if @reviewpage && !params[:museum_name].empty? && !params[:location].empty? && !params[:date_visited].empty? && !params[:content].empty?
        @reviewpage.update(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
        #@reviewpage.update
        flash[:success] = "Review edited successfully"
        redirect "/reviewpages/#{@reviewpage.id}"
      else
        flash[:error] = "Unable to edit review.  Fields cannot be blank."
        #erb :"reviewpages/edit.html"
        redirect "/reviewpages"
      end
    end

    delete '/reviewpages/:id' do
      redirect_if_not_logged_in
      @reviewpage = Reviewpage.find_by_id(params[:id])
      redirect "/reviewpages" unless @reviewpage
      authorize_user_for(@reviewpage)
      @reviewpage.update(deleted: true)
      flash[:success] = "Review deleted successfully"
      redirect "/reviewpages"
    end
end