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
    if user.save #if the user can save, (which is determined by validation, if a username or pw is not present, it won't save)
      session[:user_id] = user.id #create and assign the session id
      redirect "/characters" #show the characters page
    else
      @errors = user.errors.full_messages.join(" - ") #not being able to save produces errors for pw and username in the sessions hash which we can show
      #redirecting would cause us to lose access to these errors, instead render the erb
      erb :"users/new"
    end
  end

end