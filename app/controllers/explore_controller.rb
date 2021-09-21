class ExploreController < ApplicationController
  def index
    # @parks = NationalParkFacade.all_parks

    conn = Faraday.new(url: 'https://travel-buddy-api.herokuapp.com/api/v1/')

    response = conn.get('parks') do |req|
      req.params[:state] = params[:state]
    end

    data = JSON.parse(response.body, symbolize_names: true)
    @parks = data[:data]


    @state = params[:state]
    @activity = params[:activity]

    # @parks = NationalParkFacade.parks_by_state(params[:state])
  end

  def show; end
end
