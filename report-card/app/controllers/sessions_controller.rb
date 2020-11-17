class SessionsController < ApplicationController

    get '/signup' do
        if session[:user_id]
            erb :'sessions/signup'
        else
            erb :'sessions/signup'
        end
    end

    post '/signup' do
       #also put validations in for blanks.
        if !User.find_by(username: params[:user][:username])
            @user = User.create(params[:user])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            redirect to "/signuperror"
        end
        
    end

    get '/signuperror' do
        erb :'sessions/signuperror'
    end






    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        #binding.pry
        @user = User.find_by(username: params[:username])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            erb :'sessions/login'
        end
    end

    get '/logout' do
        #binding.pry
        session.clear
        redirect '/login'
    end

    get '/loggedin' do
        if session[:user_id]
            "you are logged in"
        else
            "you are not logged in"
        end
    end

end