class GoalsController < ApplicationController
    
    before do
        if !session[:user_id]
            halt 401, 'you do not have access to this page while not logged in. Return to the sign in page to continue.'
        end
    end

    get '/goals' do
        #binding.pry
        @goals = Goal.all
        #binding.pry
        erb :'goals/index'
    end

    get '/goals/new' do
        #binding.pry
        erb :'goals/new'
    end

    post '/goals/mygoals' do
        #binding.pry
        @user=User.all.find_by_id(session[:user_id])
        @goals = @user.goals
        erb :'goals/mygoals'
    end

    get '/goals/mygoals' do
        #binding.pry
        @user=User.all.find_by_id(session[:user_id])
        @goals = @user.goals
        erb :'goals/mygoals'
    end

    post '/goals' do
        #binding.pry
        #binding.pry
        @goal = Goal.create(params[:goal])
        @goal.user_id=session[:user_id]
        @goal.save
        redirect "/goals/#{@goal.id}"
    end

    get '/goals/:id' do
        #binding.pry
        @goal = Goal.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        #binding.pry
        erb :'goals/show'
    end

    get '/goals/:id/edit' do
        #binding.pry
        @user=User.find_by_id(session[:user_id])
        @goal = Goal.find_by_id(params[:id])
        erb :'goals/edit'
    end



    patch '/goals/:id' do
        #binding.pry
        #binding.pry
        #currently any user can edit any goal
        goal = Goal.find_by_id(params[:id])
        goal.update(params[:update])
        goal.save
        redirect "/goals/#{goal.id}"
    end

    delete '/goals/:id' do
        #binding.pry
        goal = Goal.find_by_id(params[:id])
        goal.destroy
        redirect "/goals/mygoals"
    end

end