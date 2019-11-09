class UsersController < ApplicationController

  get "/users/new" do
    erb :"/users/new.html"
  end

  post "/users/new" do
    user = User.create(:username => params[:username], :password => params[:password], :password_confirmation => params[:password_confirmation])
    session[:user_id] = user.id 
    if user.save
      redirect '/sessions/login'
    else
      redirect '/failure'
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get '/failure' do
    erb :'/users/failure.html'
  end
end