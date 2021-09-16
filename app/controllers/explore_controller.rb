class ExploreController < ApplicationController 
  def index
    @state    = params[:state]
    @activity = params[:activity]
  end
  def show; end
end 