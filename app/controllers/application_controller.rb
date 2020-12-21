require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'top_session' #Look into .env for this(https://github.com/bkeepers/dotenv), not required for proj.
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in? #is a user logged in?
      !!session[:user_id]
    end

    def current_user #who is the current logged in user?
      if @current_user
         @current_user
      else
        @current_user = User.find_by(id: session[:user_id])
      end
    end

  end

end
