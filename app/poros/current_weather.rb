class CurrentWeather
  attr_reader :current_temp,
              :current_conditions,
              :min_temp,
              :max_temp,
              :id
  
  def initialize(data)
    @id                   = data[:id]
    @current_temp         = data[:attributes][:current_temp]
    @current_conditions   = data[:attributes][:current_conditions]
    @min_temp             = data[:attributes][:min_temp]
    @max_temp             = data[:attributes][:max_temp]

  end
end
