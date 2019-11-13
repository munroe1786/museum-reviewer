class SessionsController < ApplicationController
    get '/sessions/login' do
        erb :'/sessions/login.html'
    end

    post '/sessions/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            flash[:success] = "Successfully logged in"
            redirect '/reviewpages'
        else
            flash[:error] = "Please enter the correct username and password"
            redirect '/sessions/login'
        end
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end

