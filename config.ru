require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# this is where we'll introduce middleware to override our methods for PATCH and DELETE requests
use Rack::MethodOverride

# here is where i will mount my CONTROLLERS
use UsersController
use PostsController

run ApplicationController
