class ExploreController < ApplicationController
  def index
    if params[:state].blank?
      @state = []
    else
      @state = NationalParkFacade.parks_by_state(params[:state])
    end

    if params[:activity].blank?
      @activity = []
    else
      @activity = NationalParkFacade.parks_by_activity(params[:activity])
    end


    # conn = Faraday.new(url: 'https://travel-buddy-api.herokuapp.com/api/v1/')

    # response = conn.get('parks') do |req|
    #   req.params[:activity] = params[:activity]
    # end

    # json = JSON.parse(response.body, symbolize_names: true)
    # @activity = json[:data]
  end

  def show

  end
end
