class ExploreController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://developer.nps.gov/api/v1/')
    response = conn.get('parks') do |req|
      req.params['limit'] = 465
      req.params['api_key'] = ENV['nps_api_key']
    end

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data]

    @parks = data.map do |park|
      park[:fullName]
    end

    @state    = params[:state]
    @activity = params[:activity]

    # @parks = NationalParkFacade.parks_by_state(params[:state])
  end

  def show; end
end
