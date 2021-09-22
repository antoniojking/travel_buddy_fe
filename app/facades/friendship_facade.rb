class FriendshipFacade
  def self.post_friendship(user_id, friend_email)
    FriendshipService.post_friendship(user_id, friend_email)
  end

  def self.create_user_friends(user_id)
    json = FriendshipService.get_user_friends(user_id)

    json[:data].map do |details|
      Friend.new(details)
    end
  end
end
