class AccommodationService < BaseService
  def self.get_trip_accommodations(trip_id)
    response = conn.get("/api/v1/trips/#{trip_id}/accommodations")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_accommodation(trip_id, accommodation_id)
    response = conn.get("/api/v1/trips/#{trip_id}/accommodations/#{accommodation_id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_trip_accommodations(trip_id, name, location, details)
    response = conn.post("/api/v1/trips/#{trip_id}/accommodations") do |req|
      req.headers['CONTENT_TYPE'] = 'application/json'
      req.params['name'] = name
      req.params['location'] = location
      req.params['details'] = details
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_trip_accommodations(trip_id, accommodation_id)
    conn.delete("/api/v1/trips/#{trip_id}/accommodations/#{accommodation_id}")
  end

  def self.update_trip_accommodations(trip_id, accommodation_id, name, location, details)
    response = conn.patch("/api/v1/trips/#{trip_id}/accommodations/#{accommodation_id}") do |req|
      req.headers['CONTENT_TYPE'] = 'application/json'
      req.params['name'] = name
      req.params['location'] = location
      req.params['details'] = details
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
