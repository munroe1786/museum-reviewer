class MuseumsController < ApplicationController
    get '/museums' do
        @museum = Museum.all 
        erb :'/museums/index.html'
    end

    post '/museums' do
        
    end
end