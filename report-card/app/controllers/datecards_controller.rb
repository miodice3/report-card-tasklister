class DatecardsController < ApplicationController
#this class wont need an edit function, there should be view all that belong to self, select, delete link
#at the top of the PATCH & POST requests, validate again @date.user_id == session[:user_id] before allowing edits    
#make an if else statement there, redirect them
# authorization: are you allowed to do that?
# authentication: are you who you say you are?

#look through code classes for multiple searches for ID comparrisons, you can make a private
#section of the class and put a short def find_post method and all the code there. min 49 of mondays vid.
#post.user_id = session[:user_id] << this goes to helper in application controller for helper methods

before do
    helper_method_is_logged_in?
 end    

    get '/dates' do
        @datecards = DateCard.all
        #binding.pry
        erb :'dates/index'
    end

    get '/dates/new' do
        erb :'dates/new'
    end

    get '/dates/:id' do
        @user = User.find_by(id: session[:user_id])
        @datecard = DateCard.find_by(id: params[:id].to_i)
        #binding.pry
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

end