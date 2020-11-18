class DatecardsController < ApplicationController
#this class wont need an edit function, there should be view all that belong to self, select, delete link
#at the top of the PATCH & POST requests, validate again @date.user_id == session[:user_id] before allowing edits    
#make an if else statement there, redirect them
# authorization: are you allowed to do that?
# authentication: are you who you say you are?

    before do
        if !session[:user_id] 
            halt 401, 'you do not have access to this page while not logged in. Return to the sign in page to continue.'
        end
    end

    get '/dates' do
        #binding.pry
        @datecards = DateCard.all
        #binding.pry
        erb :'dates/index'
    end

    get '/dates/new' do
        #binding.pry
        erb :'dates/new'
    end

    post '/dates/mydates' do
        #binding.pry
        @user = User.find_by_id(session[:user_id])
        @dates=@user.date_cards
        #binding.pry
        erb :'dates/mydates'
    end
    
    get '/dates/mydates' do
        #binding.pry
        @user = User.find_by_id(session[:user_id])
        @dates=@user.date_cards
        #binding.pry
        erb :'dates/mydates'
    end

    get '/dates/:id' do
        #binding.pry
        @user = User.find_by(id: session[:user_id])
        @datecard = DateCard.find_by(id: params[:id].to_i)
        erb :'dates/show'
    end

    post '/dates' do
        #binding.pry
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
        #binding.pry
        @date = DateCard.find_by_id(params[:id])
        @date.destroy
        redirect "/dates/mydates"
    end


end