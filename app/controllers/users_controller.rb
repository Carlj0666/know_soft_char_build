class UsersController < ApplicationController

  #signup

  #loads signup form
  get "/signup" do
    erb :"/users/new"
  end

  #process form/create user
  post "/signup" do
    user = User.create(params[:user])
    #binding.pry
  end

end