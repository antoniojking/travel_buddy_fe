class Trips::DashboardController < ApplicationController
  def show
    @trip_id = params[:id]
    @trip = TripFacade.trip_details(@trip_id)
  end

  def update
    update_info = params
    TripFacade.update_trip(params[:id], update_info)
    redirect_to trips_dashboard_path(params[:id])
  end
end
