class DatecardsController < ApplicationController

    def is_authorized
        @user = User.find_by_id(session[:user_id])   #current user
        if !@user.date_cards.find_by_id(params[:id].to_i)
            redirect to "/error"
        end
    end

    get '/dates/new' do
        erb :'dates/new'
    end

    get '/dates/mydates' do
        @user = User.find_by_id(session[:user_id])
        @dates=@user.date_cards
        erb :'dates/mydates'
    end

    get '/dates/:id' do
        is_authorized
        @user = User.find_by_id(session[:user_id])
        @datecard = DateCard.find_by(id: params[:id].to_i)
        erb :'dates/show'
    end

    post '/dates' do
        if DateCard.find_by(date: params[:date], user_id: session[:user_id])    #if users date card found, redirect to existing date card
            datecard = DateCard.find_by(date: params[:date], user_id: session[:user_id])
            redirect "/dates/#{datecard.id}"
        else                                                                    #if date card not found, create date card, then, create instances of all goals aka, new GDCs.
            datecard = DateCard.new(date: params[:date])                        #this is done here so when they are later edited, we can compare them with known ID's that cant be changed through HTML, or at least limit hack to users own data.
            datecard.user_id = session[:user_id]
            datecard.save

            user=User.find_by_id(session[:user_id])
            goals=user.goals

            goals.each do |goal|
                tmp = GoalDateCard.create(goal_id: goal.id, date_card_id: datecard.id)
                tmp.binary_completed= "2" #initialize to not achieved
                tmp.qty_completed = 0 #initialized to zero units achieved
                tmp.save
            end
            redirect "/dates/#{datecard.id}"
        end
    end

    delete '/dates/:id' do
        is_authorized
        @date = DateCard.find_by_id(params[:id])
        @date.destroy
        redirect "/dates/mydates"
    end

end