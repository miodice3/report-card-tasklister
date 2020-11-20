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
        @user = User.find_by(id: session[:user_id])
        @datecard = DateCard.find_by(id: params[:id].to_i)
        erb :'dates/show'
    end

    post '/dates' do
        if DateCard.find_by(date: params[:date], user_id: session[:user_id])
            datecard = DateCard.find_by(date: params[:date], user_id: session[:user_id])
            redirect "/dates/#{datecard.id}"
        else
            datecard = DateCard.new(date: params[:date])
            datecard.user_id = session[:user_id]
            datecard.save
            redirect "/dates/#{datecard.id}"
        end
    end

    delete '/dates/:id' do
        @date = DateCard.find_by_id(params[:id])
        @date.destroy
        redirect "/dates/mydates"
    end

end