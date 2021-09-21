class Trips::AccommodationsController < ApplicationController
  def show
    @accommodation = AccommodationFacade.create_accommodation_by_id(params[:dashboard_id], params[:id])
  end

  def edit
    @accommodation = AccommodationFacade.create_accommodation_by_id(params[:dashboard_id], params[:id])
  end

  def update
    accommodation = AccommodationFacade.create_accommodation_by_id(params[:dashboard_id], params[:id])

  end
end
