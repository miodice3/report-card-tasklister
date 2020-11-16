class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        @user = User.create(params)
        redirect to "/users/welcome"
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