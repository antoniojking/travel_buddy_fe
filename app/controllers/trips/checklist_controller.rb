class Trips::ChecklistController < ApplicationController
  def show

  end

  def create
    @checklist = ChecklistFacade.trip_checklist_new(params[:dashboard_id], params[:name])
    redirect_to trips_dashboard_path(params[:dashboard_id])
  end
end
