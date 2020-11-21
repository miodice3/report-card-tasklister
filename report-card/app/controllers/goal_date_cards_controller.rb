class GoalDateCardsController < ApplicationController

    # get '/gdcs' do
    #     @gdcs = GoalDateCard.all
    #     erb :'gdcs/index'
    # end

    # get '/gdcs/new' do
    #     binding.pry
    #     erb :'gdcs/new'
    # end

    post '/gdcs' do
        user = User.find_by_id(session[:user_id])
        if !user.goal_date_cards.find_by(goal_id: params[:gdc][:goal_id].to_i, date_card_id: params[:gdc][:date_card_id].to_i)
            redirect to "/error"
        else
            @gdc=GoalDateCard.find_by(goal_id: params[:gdc][:goal_id].to_i, date_card_id: params[:gdc][:date_card_id].to_i)
            @gdc.update(params[:gdc])
            @gdc.save
            redirect "/gdcs/#{@gdc.id}"
        end
    end

    # get '/gdcs/:id/edit' do
    #     binding.pry
    #     @gdc = GoalDateCard.find_by_id(params[:id])
    #     erb :'gdcs/edit'
    # end

    get '/gdcs/:id' do
        @user = User.find_by_id(session[:user_id])
        @gdc = GoalDateCard.find_by_id(params[:id])
        if !@user.goal_date_cards.find_by(id: params[:id])
            redirect to "/error"
        end
        erb :'gdcs/show'
    end

    # patch '/gdcs/:id' do
    #     binding.pry
    #     gdc = GoalDateCard.find_by_id(params[:id])
    #     gdc.update(params[:update])
    #     gdc.save
    #     redirect "/gdcs/#{gdc.id}"
    # end

    delete '/gdcs/:id' do
        @user = User.find_by_id(session[:user_id])
        if !@user.goal_date_cards.find_by(id: params[:id])
            redirect to "/error"
        end
        gdc = GoalDateCard.find_by_id(params[:id])
        gdc.destroy
        redirect "/dates/mydates"     
    end

end