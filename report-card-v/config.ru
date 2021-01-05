require './config/environment'
#require_relative 'app/controllers/products_controller' 

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
use SessionsController
use UsersController
use DatesController