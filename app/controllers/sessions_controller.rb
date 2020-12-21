class SessionsController < ApplicationController

  get "/login" do
    erb :"users/login"
  end

  post "/login" do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password]) #THE AUTHENTICATE METHOD COMES FROM HAS_SECURE_PASSWORD in the USER model. 
      #Checks to see if the password entered matches the password stored in the password digest.
      session[:user_id] = user.id
      redirect "/characters"
    else
      redirect "/login"
    end

  end

  get "/logout" do
    session.clear
    redirect "/login"
  end

end