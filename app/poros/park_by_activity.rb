class ParkByActivity
  attr_reader :name, 
              :parkcode,
              :states,
              :url
  def initialize(data)
    @name           = data[:fullname]
    @parkcode       = data[:parkCode]
    @states         = data[:states]
    @url            = data[:url]
  end 
end 
