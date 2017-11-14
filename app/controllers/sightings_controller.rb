class SightingsController < ApplicationController

  get '/sightings' do 
    authenticate!
    @sightings = Sighting.all
    erb :'sightings/index'
  end

  get '/sightings/new' do
    authenticate!
    @user = User.find(session[:user_id])
    erb :'sightings/new'
  end

  get '/sightings/:id' do
    authenticate!
    # @user = User.find(session[:user_id])
    @sighting = Sighting.find(params[:id])
    erb :'sightings/show'
  end

  post '/sightings' do
    sighting = Sighting.new(params[:sighting])
    sighting.user = User.find(session[:user_id])
    sighting.bird = Bird.find_or_create_by(params[:bird])
    if sighting.save 
      redirect "/sightings/#{sighting.id}", flash[:success] = "Sighting added successfully" 
    else
      redirect "/users/#{sighting.user.id}", flash[:error] = sighting.errors.full_messages.to_sentence
    end

  end


  get '/sightings/:id/edit' do
    authenticate!
    @sighting = Sighting.find(params[:id])
    @user = User.find(session[:user_id])
    if current_user == @user
      erb :'/sightings/edit'
    else
      redirect "/sightings/#{@sighting.id}"
    end
  end

  patch '/sightings/:id' do
    sighting = Sighting.find(params[:id])
    sighting.update(params[:sighting])
    sighting.bird = Bird.find_or_create_by(params[:bird])
    if sighting.save
      redirect "/sightings/#{sighting.id}", flash[:success] = "Update successful" 
    else
      redirect "/sightings/#{sighting.id}", flash[:error] = sighting.errors.full_messages.to_sentence
    end  
  end

  delete '/sightings/:id/delete' do
    @sighting = Sighting.find(params[:id])
    if @sighting.user == current_user
      @sighting.destroy
      flash[:success] = "Sighting removed"
      redirect "/users/#{@sighting.user_id}"
    else 
      redirect "/sightings"
    end
  end
 
end  #  End of Class