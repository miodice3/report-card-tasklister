class GoalsController < ApplicationController
    
    before do
        if !session[:user_id]
            halt 401, 'you do not have access to this page while not logged in. Return to the sign in page to continue.'
        end
    end

    get '/goals' do
        @goals = Goal.all
        #binding.pry
        erb :'goals/index'
    end

    get '/goals/new' do
        erb :'goals/new'
    end

    post '/goals' do
        #binding.pry
        @goal = Goal.create(params[:goal])
        @goal.user_id=session[:user_id]
        @goal.save
        redirect "/goals/#{@goal.id}"
    end

    get '/goals/:id/edit' do
        @user = User.find_by_id(params[:id])
        @goal = Goal.find_by_id(params[:id])
        erb :'goals/edit'
    end

    get '/goals/:id' do
        @goal = Goal.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        #binding.pry
        erb :'goals/show'
    end

    patch '/goals/:id' do
        #binding.pry
        #currently any user can edit any goal
        goal = Goal.find_by_id(params[:id])
        goal.update(params[:update])
        goal.save
        redirect "/goals/#{goal.id}"
    end

    delete '/goals/:id' do
        goal = Goal.find_by_id(params[:id])
        goal.destroy
        redirect "/goals"
    end

end