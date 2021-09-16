class ParkByActivity
  attr_reader :name, 
              :parkcode,
              :states,
              :url
  def initialize(data)
    @name           = [:fullname]
    @parkcode       = [:parkCode]
    @states         = [:states]
    @url            = [:url]
  end 
end 
