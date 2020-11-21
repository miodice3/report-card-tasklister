class UsersController < ApplicationController
   
    def is_authorized
        if session[:user_id] != params[:id].to_i
            redirect to "/error"
        end
    end

    get '/' do
        @user=User.find_by_id(session[:user_id])
        redirect "/users/#{@user.id}"
    end

    post '/users' do
        is_authorized
        @user = User.create(params[:user])
        redirect to "/users/#{@user.id}"
    end

    get '/users/me' do
        @user=User.find_by_id(session[:user_id])
        redirect "/users/#{@user.id}"
    end

    get '/users/:id' do
        is_authorized
        @user = User.find_by_id(params[:id])
        erb :'users/show'
    end

    get '/users/:id/edit' do
        is_authorized
        @user = User.find_by_id(params[:id])
        erb :'users/edit'
    end

    patch '/users/:id' do
        is_authorized
        user=User.all.find_by_id(params[:id])
        user.update(params[:update])
        user.save
        redirect "/users/#{user.id}"
    end

    delete '/users/:id' do
        is_authorized
        @user = User.find_by_id(params[:id])
        @user.destroy
        redirect "/users"
    end

end