class UsersController < ApplicationController

  #signup

  #loads signup form
  get "/signup" do
    erb :"/users/new"
  end

  #process form/create user
  post "/signup" do
    if params[:username] == nil || params[:password] == nil
      redirect "/signup"
    else
    binding.pry
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect "/characters"

  end

end