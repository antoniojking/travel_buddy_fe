class Trips::AccommodationsController < ApplicationController
  def show
    #need to have @trip too from the TripFacade
    @accommodation = AccommodationFacade.create_accommodation_by_id(params[:dashboard_id], params[:id])
  end

  def edit
    #need to have @trip too from the TripFacade
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
