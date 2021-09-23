class Park
  attr_reader :id,
              :name,
              :description,
              :phone_number,
              :directions,
              :hours,
              :state,
              :image,
              :lat,
              :lon

  def initialize(info)
    @id           = info[:id]
    @name         = info[:attributes][:name]
    @description  = info[:attributes][:description]
    @phone_number = info[:attributes][:contacts][:phoneNumbers][0][:phoneNumber]
    @directions   = info[:attributes][:directions]
    @hours        = info[:attributes][:operating_hours][0][:standardHours]
    @state        = info[:attributes][:states]
    @image        = info[:attributes][:images][0][:url]
    @lat          = info[:attributes][:lat]
    @lon          = info[:attributes][:lon]
    
  end

  def operating_hours
    @hours.map do |day, hours|
      "#{day.to_s.titleize}: #{hours}"
    end
  end

end
