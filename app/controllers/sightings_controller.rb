class SightingsController < ApplicationController

  get '/sightings' do 
    @sightings = Sighting.all
    erb :'sightings/index'
  end

  get '/sightings/:id' do
    @sighting = Sighting.find(params[:id])
    erb :'sightings/show'
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

  patch '/sightings/:id/edit' do
  end

end