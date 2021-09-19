class User
  attr_reader :id,
              :spotify_id,
              :email

  def initialize(data)
    @id =         data[:data][:id]
    @spotify_id = data[:data][:attributes][:spotify_id]
    @email =      data[:data][:attributes][:email]
  end
end
