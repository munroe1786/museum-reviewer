require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET')
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end

  helpers
    def current_user
      User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect "/login" unless logged_in?
    end
end