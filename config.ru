require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# here is where i will mount my CONTROLLERS
use UsersController

run ApplicationController
