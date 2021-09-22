class Checklist
  attr_reader :id,
              :category,
              :item_count,
              :items

  def initialize(data)
    @id         = data[:id]
    @category   = data[:attributes][:category]
    @item_count = data[:attributes][:item_count] 
    @items      = data[:attributes][:items]
  end

  def item_list
    return [] unless !@items.nil?
    @items.map do |item|
      ChecklistItem.new(item)
    end
  end
end
