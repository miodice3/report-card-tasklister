require './config/environment'
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "d8bdd92e52cfd14a5cfa"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  before do
    pass if request.path_info == "/login" || request.path_info == "/signup" || request.path_info == "/error"

    if !session[:user_id]
      redirect to "/error"
    end
  end

  get '/error' do
    erb :'reportcards/error'
  end

  get '/reportcards/new' do
    @user = User.all.find_by_id(session[:user_id])
    erb :'reportcards/new'
  end

  post '/reports' do
    session_id = session[:user_id]
    num_days = params[:num_days].to_i
#    @user = User.find_by_id(session_id[:user_id])
    @summary=ReportCard.run(num_days, session_id)
    erb :'reportcards/generated'
  end

  get '/reportcards/generated' do
    erb :'reportcards/generated'
  end

end