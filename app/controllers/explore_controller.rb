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
  end
end
