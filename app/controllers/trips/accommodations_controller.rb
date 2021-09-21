class Trips::AccommodationsController < ApplicationController
  def show
    @trip = TripFacade.trip_details(params[:dashboard_id])
    @accommodation = AccommodationFacade.create_accommodation_by_id(params[:dashboard_id], params[:id])
    require "pry";binding.pry
  end

  def edit
    require "pry";binding.pry
    @trip = TripFacade.trip_details(params[:dashboard_id])
    @accommodation = AccommodationFacade.create_accommodation_by_id(params[:dashboard_id], params[:id])
  end

  def update
    accommodation = AccommodationFacade.create_accommodation_by_id(params[:dashboard_id], params[:id])
  end

  def destroy
    #need to have @trip too from the TripFacade
    Accommodation.delete_accommodations(params[:dashboard_id], params[:id])

    redirect_to trips_dashboard_path(trip)
  end
end
