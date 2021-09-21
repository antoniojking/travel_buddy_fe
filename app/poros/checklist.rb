class Checklist
  attr_reader :id,
              :name,
              :item_count

  def initialize(data)
    @id         = data[:id]
    @category   = data[:attributes][:category]
    @item_count = data[:attributes][:item_count]
  end
end
