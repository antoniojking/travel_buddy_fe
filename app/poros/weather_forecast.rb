class WeatherForecast
  attr_reader :date,
              :min_temp,
              :max_temp,
              :condition
  

  def initialize(data)
    @date       = data[:date]
    @min_temp   = data[:min_temp]
    @max_temp   = data[:max_temp]
    @condition  = data[:condition]
  end
end


