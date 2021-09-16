class ParkByState
  attr_reader :name, 
              :parkcode,
              :description,
              :url
  def initialize(data)
    @name           = data[:fullname]
    @parkcode       = data[:parkcode]
    @description    = data[:description]
    @url            = data[:url]
  end 
end 
