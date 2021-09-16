class ParkByState
  attr_reader :name, 
              :parkcode,
              :description,
              :url
  def initialize(data)
    @name           = [:fullname]
    @parkcode       = [:parkcode]
    @description    = [:description]
    @url            = [:url]
  end 
end 
