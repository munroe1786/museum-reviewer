class SessionsController < ApplicationController
    get '/login' do
        erb :'/users/login.html'
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/users/:id'
        else
            #erb :'/users/login.html'
            redirect 'failure'
        end
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end

