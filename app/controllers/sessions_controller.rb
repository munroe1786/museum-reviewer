class SessionsController < ApplicationController
    get '/sessions/login' do
        erb :'/sessions/login.html'
    end

    post '/sessions/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/users/:id'
        else
            redirect 'failure'
        end
    end

    get '/logout' do
        session.clear
        redirect "/"
    end
end

