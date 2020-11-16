ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'


=begin
git add .
git commit -m " Put your notes here! "     
git push   <then check github


To talk in Office Hours:
1A - problem with edit form and checking boxes depending on state of varialbe
1B - how to increment the variable state during the loop for the edit phase? this will save hard coding the forms and allow flexible goals
1B can be solved by having a separate class handle the assembly of parameters, depending on state of report card and goals.

to edit:
can change array size to pickup from db column row and not have the @range things all over the place


=end