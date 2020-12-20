class CharactersController < ApplicationController

  #INDEX
  get '/characters' do
      @characters = Character.all
      erb :'characters/index'
  end

  #NEW
  get '/characters/new' do
    erb :'/characters/new'
  end

  #CREATE
  post '/characters' do
    @character = Character.create(params)
    redirect '/characters'
  end

  #build specific routes above dynamic routes

  #SHOW
  get '/characters/:id' do
    @character = Character.find_by(id: params[:id])
    if @character
      erb :'characters/show'
    else
      redirect '/characters'
    end
  end

  #EDIT
  get '/characters/:id/edit' do
    @character = Character.find_by(id: params[:id])
    erb :'/characters/edit'
  end

  #UPDATE
  patch '/characters/:id/edit' do
    @character = Character.find_by(id: params[:id])
    @character.update(name: params[:name])
    # binding.pry
  end

end