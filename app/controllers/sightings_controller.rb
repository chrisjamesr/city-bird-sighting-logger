class SightingsController < ApplicationController

  get '/sightings' do 
    authenticate!
    @sightings = Sighting.all
    erb :'sightings/index'
  end

  get '/sightings/new' do
    authenticate!
    erb :'sightings/new'
  end

  get '/sightings/:id' do
    authenticate!
    @sighting = Sighting.find(params[:id])
    erb :'sightings/show'
  end

  post '/sightings' do
    authenticate!
    sighting = Sighting.new(params[:sighting])
    sighting.user = current_user
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

  helpers do
    def revert_time
      sighting = Sighting.find(params[:id])
      t = DateTime.parse(sighting.time_date)
      t.iso8601
    end
  end
 
end  #  End of Class


#Fixes 
# 1. Update all route to use the authenticate! method
# 2. Update sightings patch route to make sure that it is the owner of the sightings 
# 3. Remove all usage of @user = User.find_by(id: session[:user_id]) except for the current_user method in application controller
# 4. Send pull request @lukeghenco