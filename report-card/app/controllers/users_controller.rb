class UsersController < ApplicationController

    get '/users/welcome' do
        erb :'users/welcome'
    end

end