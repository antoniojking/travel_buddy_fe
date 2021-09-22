class ChecklistItemFacade
  class << self
    def edit_item(trip_id, checklist_id, item_id, item_name)
      ChecklistItemService.edit_item(trip_id, checklist_id, item_id, item_name)
    end

    def delete_item(trip_id, checklist_id, item_id)
      ChecklistItemService.delete_item(trip_id, checklist_id, item_id)
    end
  end
end