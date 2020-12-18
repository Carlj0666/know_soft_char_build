class CharactersController < ApplicationController

  #INDEX
  get '/characters' do
      @characters = Character.all
      erb :'characters/index'
  end


  #build specific routes above dynamic routes


  #SHOW
  get '/characters/:id' do 
    erb :'characters/show'
  end

end