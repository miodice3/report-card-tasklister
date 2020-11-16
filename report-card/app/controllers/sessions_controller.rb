class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        #binding.pry
        #bug fix entered w no password redirects to here http://127.0.0.1:9393/users//edit
        @user = User.create(params[:user])
        redirect to "/users/#{@user.id}/edit"
        #get validation working, greet user by name
        #VALIDATE blank inputs, passwords, username, first name, etc, also duplicate usernames
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