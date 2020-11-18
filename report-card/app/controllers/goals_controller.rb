class DatecardsController < ApplicationController
    
    before do
        if !session[:user_id]
            halt 401, 'you do not have access to this page while not logged in. Return to the sign in page to continue.'
        end
    end

    get '/goals' do
        @goals = Goal.all
        erb :'goals/index'
    end

    get '/goals/new' do
        erb :'goals/new'
    end

    post '/goals' do
        binding.pry
        @goal = Goal.create(params[:goal])
        @goal.user_id=session[:user_id]
        @goal.save
        redirect "/goals/#{@goal.id}"
    end

    get '/goals/:id/edit' do
        erb :'goals/edit'
    end

    get '/goals/:id' do
        @goal = Goal.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        erb :'goals/show'
    end

    # post '/dates' do
        # if DateCard.find_by(date: params[:date], user_id: session[:user_id])
        #     datecard = DateCard.find_by(date: params[:date], user_id: session[:user_id])
        #     redirect "/dates/#{datecard.id}"
        # else
        #     datecard = DateCard.new(date: params[:date])
        #     datecard.user_id = session[:user_id]
        #     datecard.save
        #     redirect "/dates/#{datecard.id}"
        # end
    # end

end