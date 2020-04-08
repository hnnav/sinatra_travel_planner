require './config/environment'
require "./app/models/user"
require "./app/models/trip"

class TripController < ApplicationController

  # CREATE
    # render form
  get '/trips/new' do
    erb :'trips/new'
  end
  
  # create instaces

  # READ
  # show one trip


  # show all trips
  # connection: trips/index.erb


  # UPDATE
  # render update form (trips/eit.erb)
  # update instance


  # DELETE
  # a button to show page?
end