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
      @reviewpage = current_user.reviewpages.create(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
      flash[:success] = "Review created successfully"
      redirect "/reviewpages/#{@reviewpage.id}"
    end

    get '/reviewpages/:id/edit' do
      redirect_if_not_logged_in
      @reviewpage = Reviewpage.find_by_id(params[:id])
      authorize_user_for(@reviewpage)
      erb :"reviewpages/edit.html"
    end

    patch '/reviewpages/:id' do
      @reviewpage = Reviewpage.find_by_id(params[:id])
      redirect "/reviewpages" unless @reviewpage
      authorize_user_for(@reviewpage)
      if @reviewpage.update(museum_name: params[:museum_name], location: params[:location], date_visited: params[:date_visited], content: params[:content])
        flash[:success] = "Review edited successfully"
        redirect "/reviewpages/#{@reviewpage.id}"
      else
        @error = "Unable to save review due to the following error(s): #{@reviewpage.errors.full_messages.to_sentence}"
        erb :"reviewpages/edit.html"
      end
    end

    delete '/reviewpages/:id' do
      @reviewpage = Reviewpage.find_by_id(params[:id])
      redirect "/reviewpages" unless @reviewpage
      authorize_user_for(@reviewpage)
      @reviewpage.update(deleted: true)
      flash[:success] = "Review deleted successfully"
      redirect "/reviewpages"
    end

end