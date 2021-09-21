class CurrentWeather
  attr_reader :current_temp,
              :current_conditions
  

  def initialize(data)
    @current_temp         = data[:current_temp]
    @current_conditions   = data[:current_conditions]
  end
end
