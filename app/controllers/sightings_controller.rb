class SightingsController < ApplicationController

  get '/sightings' do 
    @sightings = Sighting.all
    erb :'sightings/index'
  end

  get '/sightings/:id' do
    @sighting = Sighting.find(params[:id])
    erb :'sightings/show'
  end

  post '/sightings' do
    sighting = Sighting.new(params[:sighting])
    sighting.user = User.find(session[:user_id])
    sighting.bird = Bird.find_or_create_by(params[:bird])
    if sighting.save    
      redirect "/sightings/#{sighting.id}"
    else
      redirect "/users/#{sighting.user.id}"  
    end

  end


  get '/sightings/:id/edit' do
    @sighting = Sighting.find(params[:id])
    @user = User.find(session[:user_id])
    if @sighting.user_id == @user.id
      erb :'/sightings/edit'
    else
      redirect "/sightings/#{@sighting.id}"
    end
  end



  patch '/sightings/:id' do
    binding.pry
  end

end