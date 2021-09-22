class Trips::AccommodationsController < ApplicationController
  def show
    @trip_id = params[:dashboard_id]
    @accommodation = AccommodationFacade.create_accommodation_by_id(@trip_id, params[:id])
  end

  def new
    @trip_id = params[:dashboard_id]
  end

  def create
    @trip_id = params[:dashboard_id]
    @accommodation = AccommodationFacade.create_new_accommodation(@trip_id, params[:name], params[:location], params[:details])

    redirect_to trips_dashboard_path(@trip_id)
  end

  def edit
    @trip_id = params[:dashboard_id]
    @accommodation = AccommodationFacade.create_accommodation_by_id(@trip_id, params[:id])
  end

  def update
    accommodation = AccommodationFacade.update_accommodation(params[:dashboard_id], params[:id], params[:name], params[:location], params[:details])

    redirect_to trips_dashboard_accommodation_path(params[:dashboard_id], params[:id])
  end

  def destroy
    AccommodationFacade.delete_accommodation(params[:dashboard_id], params[:id])

    redirect_to trips_dashboard_path(params[:dashboard_id])
  end
end
