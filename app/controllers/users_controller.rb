class UsersController < ApplicationController
  def show
    @friends = FriendshipFacade.create_user_friends(current_user.id)
  end
end
