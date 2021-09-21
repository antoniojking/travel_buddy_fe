class ExploreController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://travel-buddy-api.herokuapp.com/api/v1/')

    response = conn.get('parks') do |req|
      req.params[:state] = params[:state]
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @state = json[:data]

    response = conn.get('parks') do |req|
      req.params[:activity] = params[:activity]
    end

    json = JSON.parse(response.body, symbolize_names: true)
    @activity = json[:data]
  end

  def show

  end
end
