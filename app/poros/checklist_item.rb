class ChecklistItem
  attr_reader :id,
              :name,
              :user_email

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @user_email = data[:user_email]
  end
end
