require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, SecureRandom.hex(10) #may need to change this
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :test
  end

end
