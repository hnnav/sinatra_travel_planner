require './config/environment'
require "./app/models/user"
require "./app/models/trip"

class UserController < ApplicationController

  get '/users/login' do
    erb :'users/login'
  end

  # Render signup form
  get '/users/signup' do
      erb :'users/signup'
  end
  
  # create user instances
  post '/users/signup' do    
      @user = User.create(username: params[:username], password: params[:password])
      redirect "/users/#{@user.id}"
    end
    
  # dynamic route for show page
  get '/users/:id' do
    @user = User.find(params[:id]) 
    erb :'users/show'
  end
end