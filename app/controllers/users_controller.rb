class UsersController < ApplicationController
  # before_action :current_user, :only => :show

  def show
    @friends = FriendshipFacade.create_user_friends(current_user.id)
  end
end
