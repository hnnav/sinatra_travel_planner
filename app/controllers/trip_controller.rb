require './config/environment'
require "./app/models/user"
require "./app/models/trip"

class TripController < ApplicationController

  # CREATE
  # render form
  get '/trips/new' do
    if logged_in? # when i sign up this is not triggered
      erb :'trips/new'
    else
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


  # UPDATE
  # render update form (trips/eit.erb)
  # update instance


  # DELETE
  # a button added to show page
  delete '/trips/:id' do
    @trip = Trip.find(params[:id])
    @trip.delete
    redirect '/trips/index'
  end  
end