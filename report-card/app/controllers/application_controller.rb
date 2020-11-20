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
    @summary=ReportCard.run(num_days, session_id)
    erb :'reportcards/generated'
  end

  get '/reportcards/generated' do
    erb :'reportcards/generated'
  end

end

    #    helper_method_is_logged_in?

  # helpers do

  #     def is_logged_in
  #     !!session[:user_id]
  #     end
  # end
# #we can write methods here that we can use in controllers & views 
# #example below, not called anywhere yet
  
# #PRIVATES CANNOT BE USED IN OTHER CONTROLLERS, obvi.  
# #helper methods are available in ALL controllers and ARE available in all views.
# #any method written in application controller is inherited by all controller classes, not views.  helpers are inherited by all views.

#   def is_logged_in
#       !!session[:user_id]
#   end

#   def current_user
#     @user ||=User.find_by(id: session[:user_id])
#     #if @user, then that is the current user.  OR equals operator, or set it equal to current user.
#     #User.find_by(id: session[:user_id]) another way of doing it but not exactly as elegant.
#   end

#   #this one can especially be used in the erb files, instead of <%if @datecard.user_id == session[:user_id] %>
#   def authorized_to_edit(post)
#     post.user_id == session[:user_id]
#   end


#refactor tips
#look through code classes for multiple searches for ID comparrisons, you can make a private
#section of the class and put a short def find_post method and all the code there. min 49 of mondays vid.
#post.user_id = session[:user_id] << this goes to helper in application controller for helper methods