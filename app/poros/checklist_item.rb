class ChecklistItem
  attr_reader :id,
              :name,
              :item_count

  def initialize(data)
    @id        = data[:id]
    @name      = data[:name]
    @user_name = data[:user_name]
  end
end
