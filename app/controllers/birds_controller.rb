class BirdsController < ApplicationController

 get '/birds' do
    authenticate!
      @birds = Bird.all
      
      erb :'/birds/index'
  end

  get '/birds/new' do
    authenticate!
    erb :'/birds/new'
  end

  post '/birds/new' do
    authenticate!
    bird = Bird.new(params[:bird])
    if bird.save
      redirect "/birds/#{bird.id}", flash[:success] = "#{bird.species.capitalize} added to the log" 
    else
      redirect '/birds/new', flash[:error] = bird.errors.full_messages.to_sentence  
    end
  end

  get '/birds/:id' do
    authenticate!
    @bird = Bird.find(params[:id])
    erb :'/birds/show'
  end

  get '/birds/:id/edit' do
    authenticate!
    @bird = Bird.find(params[:id])
    erb :'/birds/edit'
  end

  patch '/birds/:id' do
    authenticate!
    bird = Bird.find(params[:id])
    if bird.update(params[:bird])
      redirect "/birds/#{bird.id}", flash[:success] = "#{bird.species.capitalize} Updated"
    else
      redirect "/birds/#{bird.id}/edit", flash[:error] = bird.errors.full_messages.to_sentence     
    end
  end  

  delete '/birds/:id/delete' do
    authenticate!
    @bird = Bird.find(params[:id])
      @bird.destroy
      flash[:success] = "Bird removed"
      redirect "/birds"
    # else 
    #   redirect "/sightings"
    # end
  end


end