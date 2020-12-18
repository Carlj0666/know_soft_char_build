class CharactersController < ApplicationController

  get '/characters' do #THIS IS THE INDEX AND LOADS ALL ARTISTS
      @characters = Character.all
      erb :'characters/index'
  end

end