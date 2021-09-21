class ParksController < ApplicationController
  def show
    @park = NationalParkFacade.park_by_code(params[:park_code])
  end
end