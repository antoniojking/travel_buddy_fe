class Trips::DashboardController < ApplicationController
  # def show
  #   @trip_id = params[:id]
  #   @checklists = ChecklistFacade.by_trip(@trip_id)
  # end

  def show
    @trip = TripFacade.trip_details(params[:id])
  end
end
