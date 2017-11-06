class BirdsController < ApplicationController

  


  get '/birds' do
    authenticate!
      erb :'/birds/index'
  end

  get '/birds/new' do
    authenticate!
    erb :'/birds/new'
  end

  post '/birds/new' do
    
    bird = Bird.new(params[:bird])
    if bird.save
      redirect "/birds/#{bird.id}"
    else
      redirect '/birds/new'  
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
    bird = Bird.find(params[:id])
    bird.update(params[:bird])
    redirect "/birds/#{bird.id}"
  end


end