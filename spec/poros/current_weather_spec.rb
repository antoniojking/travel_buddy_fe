require "rails_helper"

RSpec.describe CurrentWeather do
  it 'exists and has attributes' do
    attributes = {
                current_temp: 22.2, 
                current_conditions: 'Partly cloudy'
    }

    weather = CurrentWeather.new(attributes)

    expect(weather).to be_an_instance_of(CurrentWeather)
    expect(weather.current_temp).to eq(attributes[:current_temp])
    expect(weather.current_conditions).to eq(attributes[:current_conditions])
  end
end 