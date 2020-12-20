class UsersController < ApplicationController

  #signup

  #loads signup form
  get "/signup" do
    erb :"/users/new"
  end

  #process form/create user
  post "/signup" do
    if params[:user][:username] == "" || params[:user][:password] == ""
      redirect "/signup"
    else
    # binding.pry
    user = User.create(params[:user])
    session[:user_id] = user.id
    redirect "/characters"
    end
  end

end