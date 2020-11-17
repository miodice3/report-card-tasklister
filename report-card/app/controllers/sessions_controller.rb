class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end


 
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        binding.pry
    end

    post '/login' do
    end

end