class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      user = User.find(session[:user_id])
      redirect "/users/#{user.id}"
    else  
      erb :'/users/create_user'
    end  
  end

  post '/signup' do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/signup'
    end
  end  

  get '/login' do
    if logged_in?
      user = User.find(session[:user_id])
      redirect "/users/#{user.id}"
    else  
      erb :'/users/login'
    end
  end

   post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/login'
    end
  end 

  get '/users' do
    authenticate!
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

  # unnecessary
  get '/users/:id/edit' do
    @user = User.find(params[:id])
    redirect "/users/#{@user.id}"
    # erb :'/users/edit'
  end  

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
      redirect '/login'
    else
      redirect '/'
    end
  end



end  #  End of Class
