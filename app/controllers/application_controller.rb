require 'rack-flash'
require 'sinatra/redirect_with_flash'


class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    # register Sinatra::Flash
    enable :sessions 
    set :session_secret, "secret"
  end
  

  get '/' do
    erb :root, layout: :root_layout
  end

  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def authenticate!
      unless session[:user_id]
        redirect '/'
      end
    end
      
    def current_user
      User.find(session[:user_id])
    end

    Sinatra::RedirectWithFlash
    

  end  #  End of Helpers

  
end