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

end
