class GoalsController < ApplicationController
    
    get '/goals' do
        @goals = Goal.all
        erb :'goals/index'
    end

    get '/goals/new' do
        erb :'goals/new'
    end

    get '/goals/mygoals' do
        @user=User.all.find_by_id(session[:user_id])
        @goals = @user.goals
        erb :'goals/mygoals'
    end

    post '/goals' do
        @goal = Goal.create(params[:goal])
        @goal.user_id=session[:user_id]
        @goal.save
        redirect "/goals/#{@goal.id}"
    end

    get '/goals/:id' do
        @goal = Goal.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        erb :'goals/show'
    end

    get '/goals/:id/edit' do
        @user=User.find_by_id(session[:user_id])
        @goal = Goal.find_by_id(params[:id])
        erb :'goals/edit'
    end

    patch '/goals/:id' do
        #currently any user can edit any goal
        goal = Goal.find_by_id(params[:id])
        goal.update(params[:update])
        goal.save
        redirect "/goals/#{goal.id}"
    end

    delete '/goals/:id' do
        goal = Goal.find_by_id(params[:id])
        goal.destroy
        redirect "/goals/mygoals"
    end

end