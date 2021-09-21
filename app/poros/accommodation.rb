class Accommodation
  attr_reader :name, :location, :details

  def initialize(accommodation_data)
    @name = accommodation_data[:name]
    @location = accommodation_data[:location]
    @details = accommodation_data[:details]
  end
end
