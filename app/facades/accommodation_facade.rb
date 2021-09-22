class AccommodationFacade
  def self.create_accommodations_for_trip(trip_id)
    json = AccommodationService.get_trip_accommodations(trip_id)
    json[:data].map do |accommodation|
      Accommodation.new(accommodation)
    end
  end

  def self.create_accommodation_by_id(trip_id, accommodation_id)
    json = AccommodationService.get_accommodation(trip_id, accommodation_id)

    Accommodation.new(json[:data])
  end

  # def self.create_accommodation(trip_id, name, location, description)
  #   json = AccommodationService.create_trip_accommodation(trip_id, name, location, description)
  #   User.new(json)
  # end

  def self.update_accommodation(trip_id, accommodation_id, name, location, details)
    json = AccommodationService.update_trip_accommodations(trip_id, accommodation_id, name, location, details)

    Accommodation.new(json[:data])
  end
end
