class BirdsController < ApplicationController

  get '/birds/new' do
    erb :'/birds/new'
  end

  get '/birds/' do
    erb :'/birds/index'
  end

  get '/birds/:id' do
    erb :'/birds/show'
  end


end