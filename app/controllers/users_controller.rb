class UsersController < ApplicationController

  #signup

  #loads signup form
  get "/signup" do
    erb :"/users/new"
  end

  #process form/create user
  post "/signup" do
    user = User.new(params[:user])
    #we don't make an instance variable becuase we are redirecting which will cause us to lose the var as soon as it redirects
    if user.save
      session[:user_id] = user.id
      redirect "/characters"
    else
      @errors = user.errors.full_messages
      #redirecting would cause us to lose access to these errors, instead render the erb
      erb :"users/new"
    end
  end

end