class MuseumsController < ApplicationController
    get '/museums' do
        @museums = Museum.all 
        erb :'/museums/index.html'
    end

    post '/museums' do
        erb :'/museums/new.html'
    end

    get 'museums/new' do
    end
end