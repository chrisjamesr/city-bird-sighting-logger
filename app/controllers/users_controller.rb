class UsersController < ApplicationController
  # use Rack::Flash
  get '/signup' do
    if logged_in?
      # user = User.find(session[:user_id])
      redirect "/users/#{current_user.id}"
    else  
      erb :'/users/create_user'
    end  
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{user.id}", flash[:success] = "Welcome #{user.username}"
    else
      redirect '/signup', flash[:error] = user.errors.full_messages.to_sentence
    end
  end  

  get '/login' do
    if logged_in?
      redirect "/users/#{current_user.id}", flash[:error] = "Already signed in as #{user.username}"
    else  
      erb :'/users/login' 
    end
  end

   post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id      
      redirect "/users/#{user.id}", flash[:success] = "Welcome #{user.username}"
    else
      redirect '/login', flash[:error] = "Wrong Username or Password"
    end
  end 

  get '/users' do
    authenticate!
    flash[:message] = "Welcome!"
    @users = User.all
    erb :'/users/index'
  end

  get '/users/:id' do
    authenticate!
    @user = User.find(params[:id])
    if session[:original_request]
      redirect "#{session[:original_request]}"
    else
      erb :'/users/show'
    end
  end

  # # unnecessary
  # get '/users/:id/edit' do
  #   @user = User.find(params[:id])
  #   redirect "/users/#{@user.id}", flash[:error] = "That function is not currently available"
  #   # erb :'/users/edit'
  # end  

  # patch '/users/:id/edit' do
  #   user = User.find_by(username: user[:username])
  #   if user && user.authenticate(params[:password])

  #   redirect '/users'
  # end  
# set layout for view
  # get "/foo" do
  #  erb :index, :layout => :nameofyourlayoutfile
  # end 



  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login', flash[:success] = "Logged Out"
    else
      redirect '/'
    end
  end



end  #  End of Class
