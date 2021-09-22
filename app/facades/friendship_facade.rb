class FriendshipFacade
  def self.post_friendship(user_id, friend_email)
    FriendshipService.post_friendship(user_id, friend_email)
  end
end
