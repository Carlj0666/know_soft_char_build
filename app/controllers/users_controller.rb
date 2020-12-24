class UsersController < ApplicationController

  #SIGNUP
  get "/signup" do
    erb :"/users/new"
  end

  #Process Signup
  post "/signup" do
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect "/characters"
    else
      @errors = user.errors.full_messages.join(" - ")
      erb :"users/new"
    end
  end

end