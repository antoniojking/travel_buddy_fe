class Accommodation
  attr_reader :name, :location, :description

  def initialize(accommodation_data)
    @name = accommodation_data[:name]
    @location = accommodation_data[:location]
    @description = accommodation_data[:description]
  end
end
