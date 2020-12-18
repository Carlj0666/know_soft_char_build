class CharactersController < ApplicationController

  get '/characters' do #THIS IS THE INDEX AND LOADS ALL ARTISTS
      erb :'characters/index'
  end

end