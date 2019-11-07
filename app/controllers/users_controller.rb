class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup.html"
  end

  post "/signup" do
    user = User.create(:username => params[:username], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    session[:user_id] = user.id 
    if user.save
      redirect "/sessions/login"
    else
      redirect "/users/failure"
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

  get "/users/failure" do
    
  end
end
