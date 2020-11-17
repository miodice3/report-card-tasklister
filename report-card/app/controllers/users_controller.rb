class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        #binding.pry
        erb :'users/index'
    end
    
    #temporarily disabled, routing new user sign up through sessions controller class
    # get '/users/new' do
    #     erb :'users/new'
    # end

    post '/users' do
        #binding.pry
        @user = User.create(params[:user])
        redirect to "/users/#{@user.id}"
    end

    get '/users/:id' do
        #binding.pry
        @user = User.find_by_id(params[:id])
        erb :'users/show'
    end

    get '/users/:id/edit' do
        #binding.pry
        @user = User.find_by_id(params[:id])
        erb :'users/edit'
    end

    patch '/users/:id' do
        user=User.all.find_by_id(params[:id])
        user.update(params[:update])
        user.save
        redirect "/users/#{user.id}"
    end

    delete '/users/:id' do
        @user = User.find_by_id(params[:id])
        @user.destroy
        redirect "/users"
    end

end