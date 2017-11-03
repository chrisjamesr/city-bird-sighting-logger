class SightingsController < ApplicationController

  get '/sightings' do 
    @sightings = Sighting.all
    erb :'sightings/index'
  end



end