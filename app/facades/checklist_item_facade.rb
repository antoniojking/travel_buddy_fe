class ChecklistItemFacade
  class << self
    def edit_item(trip_id, checklist_id, item_id, item_name)
      ChecklistItemService.edit_item(trip_id, checklist_id, item_id, item_name)
    end
  end
end