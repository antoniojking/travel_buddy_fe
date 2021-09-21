require "rails_helper"

RSpec.describe WeatherForecast do
  it 'exists and has attributes' do
    attributes = {
                date: '2021-09-17', 
                min_temp: 50, 
                max_temp: 90, 
                condition: 'Partly cloudy'
    }

    weather = WeatherForecast.new(attributes)

    expect(weather).to be_an_instance_of(WeatherForecast)
    expect(weather.date).to eq(attributes[:date])
    expect(weather.condition).to eq(attributes[:condition])
    expect(weather.min_temp).to eq(attributes[:min_temp])
    expect(weather.max_temp).to eq(attributes[:max_temp])
  end
end 