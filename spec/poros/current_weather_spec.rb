require "rails_helper"

RSpec.describe CurrentWeather do
  it 'exists and has attributes' do
    attributes =  {
          id: "800",
          type: "weather",
          attributes: {
              current_temp: 64.78,
              min_temp: 62.82,
              max_temp: 66.72,
              current_conditions: "clear sky"
          }
  }
    weather = CurrentWeather.new(attributes)

    expect(weather).to be_an_instance_of(CurrentWeather)
    expect(weather.current_temp).to eq(attributes[:attributes][:current_temp])
    expect(weather.current_conditions).to eq(attributes[:attributes][:current_conditions])
  end
end 