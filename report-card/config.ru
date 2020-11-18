require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
use SessionsController
use UsersController
use DatecardsController
use GoalsController
use GoalDateCardsController

# configure do
#   set :public_folder, 'public'
#   set :views, 'app/views'
#   enable :sessions
#   set :session_secret, "placeholder"
#   use Rack::MethodOverride
# end