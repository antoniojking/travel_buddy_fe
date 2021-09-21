class Trips::DashboardController < ApplicationController
  def show
    @trip_id = params[:id]
    @trip = TripFacade.trip_details(@trip_id)
  end
end
