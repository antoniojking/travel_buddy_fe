class Trips::TravelBuddiesController < ApplicationController
  def create
    TravelBuddyFacade.travel_buddy_new(params[:dashboard_id], params[:friend_id])
    redirect_to trips_dashboard_path(params[:dashboard_id])
  end
end
