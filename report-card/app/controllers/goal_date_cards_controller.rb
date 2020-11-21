class GoalDateCardsController < ApplicationController

    def is_authorized
        @user = User.find_by_id(session[:user_id])
        @gdc = GoalDateCard.find_by_id(params[:id])
        if !@user.goal_date_cards.find_by(id: params[:id])
            redirect to "/error"
        end
    end

    post '/gdcs' do
        user = User.find_by_id(session[:user_id])
        if !user.goal_date_cards.find_by(goal_id: params[:gdc][:goal_id].to_i, date_card_id: params[:gdc][:date_card_id].to_i) #validate if user owns gdc, if not, error.
            redirect to "/error"
        else
            @gdc=GoalDateCard.find_by(goal_id: params[:gdc][:goal_id].to_i, date_card_id: params[:gdc][:date_card_id].to_i) #locate and update existing gdc belonging to user
            @gdc.update(params[:gdc])
            @gdc.save
            redirect "/gdcs/#{@gdc.id}"
        end
    end

    get '/gdcs/:id' do
        is_authorized
        erb :'gdcs/show'
    end

    delete '/gdcs/:id' do
        is_authorized
        @gdc.destroy
        redirect "/dates/mydates"     
    end

end