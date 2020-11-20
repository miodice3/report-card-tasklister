class UsersController < ApplicationController
   
    post '/users' do
        if session[:user_id] != params[:id].to_i
            redirect to "/error"
        end
        @user = User.create(params[:user])
        redirect to "/users/#{@user.id}"
    end

    get '/users/me' do
        @user=User.find_by_id(session[:user_id])
        redirect "/users/#{@user.id}"
    end

    get '/users/:id' do
        #need to put validations in here so the user cannot submit blank fields
        if session[:user_id] != params[:id].to_i
            redirect to "/error"
        end
#        binding.pry
        @user = User.find_by_id(params[:id])
        erb :'users/show'
    end

    get '/users/:id/edit' do
        #binding.pry
        if session[:user_id] != params[:id].to_i
            redirect to "/error"
        end
        @user = User.find_by_id(params[:id])
        erb :'users/edit'
    end

    patch '/users/:id' do
        if session[:user_id] != params[:id].to_i
            redirect to "/error"
        end
        user=User.all.find_by_id(params[:id])
        user.update(params[:update])
        user.save
        redirect "/users/#{user.id}"
    end

    delete '/users/:id' do
        if session[:user_id] != params[:id].to_i
            redirect to "/error"
        end
        @user = User.find_by_id(params[:id])
        @user.destroy
        redirect "/users"
    end

end