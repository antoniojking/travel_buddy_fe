class Accommodation
  attr_reader :id,
              :name,
              :location,
              :details

  def initialize(accommodation_data)
    @id       = accommodation_data[:id]
    @name     = accommodation_data[:attributes][:name]
    @location = accommodation_data[:attributes][:location]
    @details  = accommodation_data[:attributes][:details]
  end
end
