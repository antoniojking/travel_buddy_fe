class Trips::ChecklistController < ApplicationController
  def show
    @trip_id = params[:dashboard_id]
    @checklist_id = params[:id]
    @checklist = ChecklistFacade.grab_checklist(@trip_id, @checklist_id)
  end

  def create
    @checklist = ChecklistFacade.trip_checklist_new(params[:dashboard_id], params[:category])
    redirect_to trips_dashboard_path(params[:dashboard_id])
  end
end
