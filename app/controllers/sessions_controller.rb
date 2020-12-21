class SessionsController < ApplicationController

  get "/login" do
    erb :"users/login"
  end
  
  get "/logout" do 
    session.clear
    redirect "/login"
  end

end