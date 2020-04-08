require './config/environment'
require "./app/models/user"
require "./app/models/trip"

class UserController < ApplicationController

  get '/users/login' do
    erb :'users/login'
  end

  get '/users/signup' do
      erb :'users/signup'
  end
  
  post '/users/signup' do    
      @user = User.create(username: params[:username], password: params[:password])
      redirect "/users/#{@user.id}" #users/show
    end
    
  # dynamic route for show page
  get '/users/:id' do
    @user = User.find(params[:id]) 
    erb :'users/show'
  end
end