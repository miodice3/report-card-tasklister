class DatecardsController < ApplicationController

    get '/dates' do
        erb :'dates/index'
    end

end