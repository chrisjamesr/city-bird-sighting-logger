class SightingsController < ApplicationController

  get '/sightings' do 
    @sightings = Sighting.all
    erb :'sightings/index'
  end

  get '/sightings/:id' do
    @sighting = Sighting.find(params[:id])
    erb :'sightings/show'
  end


end