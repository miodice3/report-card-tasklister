class DatecardsController < ApplicationController
#this class wont need an edit function, there should be view all that belong to self, select, delete link
#at the top of the PATCH & POST requests, validate again @date.user_id == session[:user_id] before allowing edits    
#make an if else statement there, redirect them
# authorization: are you allowed to do that?
# authentication: are you who you say you are?

    get '/dates/new' do
        erb :'dates/new'
    end
    
    get '/dates/mydates' do
        @user = User.find_by_id(session[:user_id])
        @dates=@user.date_cards
        erb :'dates/mydates'
    end

    get '/dates/:id' do
        #binding.pry
        user = User.find_by_id(session[:user_id])   #current user
            if !user.date_cards.find_by_id(params[:id].to_i)
                redirect to "/error"
            else
                #binding.pry
                @user = User.find_by_id(session[:user_id])
                @datecard = DateCard.find_by(id: params[:id].to_i)
                erb :'dates/show'
            end

    end

    # post '/dates' do
    #     #binding.pry
    #     if DateCard.find_by(date: params[:date], user_id: session[:user_id])
    #         datecard = DateCard.find_by(date: params[:date], user_id: session[:user_id])
    #         redirect "/dates/#{datecard.id}"
    #     else
    #         datecard = DateCard.new(date: params[:date])
    #         datecard.user_id = session[:user_id]
    #         datecard.save
    #         redirect "/dates/#{datecard.id}"
    #     end
    # end
############## review this one tomorrow.
    post '/datestest' do
        if DateCard.find_by(date: params[:date], user_id: session[:user_id])    #if users date card found, redirect to existing date card
            datecard = DateCard.find_by(date: params[:date], user_id: session[:user_id])
            redirect "/dates/#{datecard.id}"
        else
            datecard = DateCard.new(date: params[:date])
            datecard.user_id = session[:user_id]
            datecard.save
            #binding.pry

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
        user = User.find_by_id(session[:user_id])
            if !user.date_cards.find_by_id(params[:id].to_i)
                redirect to "/error"
            else
                @date = DateCard.find_by_id(params[:id])
                @date.destroy
                redirect "/dates/mydates"
            end
    end

end