class Friend
  attr_reader :id, :email

  def initialize(info)
    @id = info[:id]
    @email = info[:attributes][:email]
  end
end
