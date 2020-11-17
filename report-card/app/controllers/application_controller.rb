require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "d8bdd92e52cfd14a5cfa" #SecureRandom.hex(10) #may need to change this
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :test
  end

  helpers do
    #we can write methods here that we can use in controllers & views 
    #example below, not called anywhere yet
  
#PRIVATES CANNOT BE USED IN OTHER CONTROLLERS, obvi.  
#helper methods are available in ALL controllers and ARE available in all views.
#any method written in application controller is inherited by all controller classes, not views.  helpers are inherited by all views.

  def is_logged_in
      !!session[:user_id]
  end

  def current_user
    @user ||=User.find_by(id: session[:user_id])
    #if @user, then that is the current user.  OR equals operator, or set it equal to current user.
    #User.find_by(id: session[:user_id]) another way of doing it but not exactly as elegant.
  end

  #this one can especially be used in the erb files, instead of <%if @datecard.user_id == session[:user_id] %>
  def authorized_to_edit(post)
    post.user_id == session[:user_id]
  end

end
