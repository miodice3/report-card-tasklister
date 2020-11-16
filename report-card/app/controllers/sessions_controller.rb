class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        #binding.pry
        @user = User.create(params[:user])
        redirect to "/users/welcome"
        #get validation working, greet user by name
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