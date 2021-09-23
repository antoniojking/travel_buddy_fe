class Trips::DashboardController < ApplicationController
  def show
    @trip_id = params[:id]
    @trip = TripFacade.trip_details(@trip_id)
  end

  def create
    park_code = params[:park_code]
    user_id = session[:user_id]
    park_name = params[:park_name]
    @trip = TripFacade.new_trip(park_code, park_name, user_id)
    redirect_to trips_dashboard_path(@trip.id)
  end

  def update
    # require "pry";binding.pry
    update_info = params
    TripFacade.update_trip(params[:id], update_info)
    redirect_to trips_dashboard_path(params[:id])
  end
end
