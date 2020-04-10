require './config/environment'
require "./app/models/user"
require "./app/models/trip"

class TripController < ApplicationController

  # CREATE
  # render form
  get '/trips/new' do
    if logged_in? 
      erb :'/trips/new'
    else
      flash[:alert] = "Please login first before making travel plans!"
      redirect "/users/login"
    end
  end

  # create instaces
  post '/trips' do 
    @trip = Trip.create(
        destination: params[:destination], 
        date: params[:date], 
        budjet: params[:budjet]
    )
    current_user.trips << @trip
    redirect "/trips/#{@trip.id}" #trips/show
  end 

  # READ
  # dynamic route: show one trip
  get '/trips/:id' do 
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end 

  # show all trips
  # connection: trips/index.erb
  get '/trips' do
    @trips = Trip.all
    erb :'/trips/index'
  end
  
  # UPDATE
  # render update form (trips/edit.erb)
  get '/trips/:id/edit' do 
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end 

  # update instance
  post '/trips/:id' do 
    @trip = Trip.find(params[:id])
    @trip.update(
      destination: params[:destination], 
      date: params[:date], 
      budjet: params[:budjet]
    )
    redirect "/trips/#{@trip.id}"
  end 

  # DELETE
  # a button added to show page
  # this is not redirecting / also instances persist
  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect "/users/#{@user.id}" # not redirecting
  end  

end