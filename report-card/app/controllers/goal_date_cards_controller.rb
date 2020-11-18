class GoalDateCardsController < ApplicationController


    before do
        if !session[:user_id]
            halt 401, 'you do not have access to this page while not logged in. Return to the sign in page to continue.'
        end
    end

    get '/gdcs' do
        @gdcs = GoalDateCard.all
        erb :'gdcs/index'
    end

    get '/gdcs/new' do
        #binding.pry
#        @user = User.all.find_by_id(session[:user_id])
        erb :'gdcs/new'
    end

    post '/gdcs' do
        binding.pry
        @gdc = GoalDateCard.create(params[:goal])
        #######
        @gdc.user_id=session[:user_id]
        @gdc.save
        redirect "/gdcs/#{@gdc.id}"
    end

    get '/gdcs/:id/edit' do
        @user = User.find_by_id(params[:id])
        @gdc = Goal.find_by_id(params[:id])
        erb :'gdcs/edit'
    end

    get '/gdcs/:id' do
        @gdc = Goal.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        #binding.pry
        erb :'gdcs/show'
    end

    patch '/gdcs/:id' do
        #binding.pry
        #currently any user can edit any goal
        gdc = Goal.find_by_id(params[:id])
        gdc.update(params[:update])
        gdc.save
        redirect "/gdcs/#{gdc.id}"
    end

    delete '/gdcs/:id' do
        gdc = Goal.find_by_id(params[:id])
        gdc.destroy
        redirect "/gdcs"
    end

end