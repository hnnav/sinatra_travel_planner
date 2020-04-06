require './config/environment'
require "./app/models/user"
require "./app/models/trip"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    # erb :welcome
    "Hello this works"
  end

end
