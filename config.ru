require './config/environment'

use Rack::Static, :urls => ['/css', '/assets'], :root => 'public' # Rack fix allows seeing the css folder.
# set :public_folder, File.dirname(__FILE__) + '/public'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride
use UsersController
use BirdsController
use SightingsController
run ApplicationController