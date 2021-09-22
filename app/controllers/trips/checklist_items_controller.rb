class Trips::ChecklistItemsController < ApplicationController
  def update
    item_id = params[:id]
    ChecklistItemFacade.edit_item(params[:dashboard_id], params[:checklist_id], item_id, params[:name])
    redirect_to "/trips/dashboard/#{params[:dashboard_id]}/checklist/#{params[:checklist_id]}"
  end

  def destroy
    item_id = params[:id]
    ChecklistItemFacade.delete_item(params[:dashboard_id], params[:checklist_id], item_id)
    redirect_to "/trips/dashboard/#{params[:dashboard_id]}/checklist/#{params[:checklist_id]}"
  end
end