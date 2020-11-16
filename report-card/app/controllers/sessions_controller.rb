class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        binding.pry
#        <button type="submit" name="button">Click to sign up!</button>

    end
 
    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        binding.pry
    end

    post '/login' do

    end
end