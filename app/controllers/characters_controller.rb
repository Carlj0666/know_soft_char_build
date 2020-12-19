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

end