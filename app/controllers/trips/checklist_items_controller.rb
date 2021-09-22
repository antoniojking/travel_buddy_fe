class Trips::ChecklistItemsController < ApplicationController
  def update
    item_id = params[:id]
    checklist_id = params[:checklist_id]
    trip_id = params[:dashboard_id]
    ChecklistItemFacade.edit_item(trip_id, checklist_id, item_id, params[:name])
    redirect_to "/trips/dashboard/#{trip_id}/checklist/#{checklist_id}"
  end
end