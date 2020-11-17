class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        #binding.pry
        @user = User.create(params[:user])
        redirect to "/users/#{@user.id}"
    end
 
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        binding.pry
    end



end