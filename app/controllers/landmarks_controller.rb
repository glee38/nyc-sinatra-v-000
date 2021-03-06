class LandmarksController < ApplicationController
get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    if !params[:figure][:name].empty?
      @landmark.figures << Figure.find_or_create_by(name: params[:figure][:name])
    end

    erb :'landmarks/show'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    if !params[:figure][:name].empty?
      @landmark.figure = Figure.find_or_create_by(name: params[:figure][:name])
      @landmark.save
    end

    erb :'landmarks/show'
  end
end
