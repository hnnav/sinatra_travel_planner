require './config/environment'
require "./app/models/user"
require "./app/models/trip"

class UserController < ApplicationController

  # render login page
  get '/users/login' do 
    if logged_in?   
       redirect "/users/#{current_user.id}"  
    else
       erb :'/users/login'
    end 
  end 

  # find user, set session
  post '/users/login' do 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id 
       redirect "/users/#{@user.id}"
    else  
       redirect "/users/login"
    end 
  end 

  # render signup form
  get '/users/signup' do 
    if logged_in? 
       redirect "/users/#{current_user.id}"
    else
       erb :'/users/signup'        
    end 
  end 
  
  # create user instance
  post '/users/signup' do
    if params[:username] == "" && params[:password] == ""
      flash[:alert] = "Please enter username and password"
      redirect "/users/signup"
    else 
      if params[:password] == params[:password_confirmation]
         @user = User.create(
          username: params[:username], 
          password: params[:password]
         )
         session[:user_id] = @user.id 
         redirect "/users/#{@user.id}" #users/show
      else 
         flash[:alert] = "Wrong password"
         redirect "/users/signup"
      end 
    end 
  end 
  
  # dynamic route for show page
  get '/users/:id' do
    @user = User.find(params[:id]) 
    erb :'users/show'
  end

  # logout method
  get '/logout' do 
    session.clear
    redirect '/users/login'
  end 
end