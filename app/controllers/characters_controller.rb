class CharactersController < ApplicationController

  #NEW
  get "/characters/new" do
    erb :'/characters/new'
  end

  #CREATE
  post "/characters" do
    character = current_user.characters.create(params)
    if character.save
      redirect '/characters'
    else
      @errors = character.errors.full_messages.join(" - ")
      erb :"characters/new"
    end
  end

  #INDEX
  get "/characters" do
      @characters = Character.all
      erb :'characters/index'
  end

  #SHOW
  get "/characters/:id" do
    @character = Character.find_by(id: params[:id])
    if @character
      erb :'characters/show'
    else
      redirect "/characters"
    end
  end

  #EDIT
  get "/characters/:id/edit" do
    @character = Character.find_by(id: params[:id])
    if @character.user == current_user
      erb :'/characters/edit'
    else
      redirect "/characters"
    end
  end

  #UPDATE
  patch "/characters/:id/edit" do
    @character = Character.find_by(id: params[:id])
    if @character.user == current_user
      @character.update(params[:character])
      redirect "/characters/#{@character.id}"
    else
      redirect "/characters"
    end
  end

  #DELETE
  delete "/characters/:id" do
    @character = Character.find_by(id: params[:id])
    if @character && @character.user == current_user
      @character.destroy
      redirect "/characters"
      else
      redirect "/characters"
    end
  end

end