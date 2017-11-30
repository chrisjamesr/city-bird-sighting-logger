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
      !!current_user
    end

    def authenticate!
      unless logged_in?
        redirect '/'
      end
    end
      
    def current_user #=> User Instance || nil
      # memoization
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    Sinatra::RedirectWithFlash
    

  end  #  End of Helpers

  
end