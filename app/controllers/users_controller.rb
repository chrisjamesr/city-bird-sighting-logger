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
    user = User.find_by(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect '/signup'
    end
  end 

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'/users/edit'
  end  




  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end



end  #  End of Class
