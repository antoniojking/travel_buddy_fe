class ExploreController < ApplicationController
  def index
    @parks = NationalParkFacade.all_parks
    @state    = params[:state]
    @activity = params[:activity]

    # @parks = NationalParkFacade.parks_by_state(params[:state])
  end

  def show; end
end
