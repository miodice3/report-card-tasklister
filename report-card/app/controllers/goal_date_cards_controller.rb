class GoalDateCardsController < ApplicationController

    get '/gdcs' do
        @gdcs = GoalDateCard.all
        erb :'gdcs/index'
    end

    get '/gdcs/new' do
        erb :'gdcs/new'
    end

    post '/gdcs' do
            if @gdc=GoalDateCard.find_by(goal_id: params[:gdc][:goal_id].to_i, date_card_id: params[:gdc][:date_card_id].to_i)
                @gdc.update(params[:gdc])
                @gdc.save
            else
                @gdc = GoalDateCard.create(params[:gdc])
            end
        redirect "/gdcs/#{@gdc.id}"
    end

    get '/gdcs/:id/edit' do
        @gdc = GoalDateCard.find_by_id(params[:id])
        erb :'gdcs/edit'
    end

    get '/gdcs/:id' do
        @gdc = GoalDateCard.find_by_id(params[:id])
        erb :'gdcs/show'
    end

    patch '/gdcs/:id' do
        gdc = GoalDateCard.find_by_id(params[:id])
        gdc.update(params[:update])
        gdc.save
        redirect "/gdcs/#{gdc.id}"
    end

    delete '/gdcs/:id' do
        gdc = GoalDateCard.find_by_id(params[:id])
        gdc.destroy
        redirect "/gdcs"
    end

end