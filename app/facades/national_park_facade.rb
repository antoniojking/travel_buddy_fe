class NationalParkFacade
  def self.all_parks
   json = NationalParkService.all_parks

   json[:data].map do |park_data|
     Park.new(park_data)
   end
  end
end
