class BaseService
  def self.conn
    Faraday.new(url: "https://travel-buddy-api.herokuapp.com")
  end
end
