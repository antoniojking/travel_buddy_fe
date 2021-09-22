class FriendshipsController < ApplicationController
  def create
    friend = FriendshipFacade.post_friendship(params[:user_id], params[:friend])

    user = 
    redirect_to '/user_dashboard'
  end
end
