class FriendshipService < BaseService
  def self.post_friendship(user_id, friend_email)
    response = conn.post("/api/v1/users/#{user_id}/friendships") do |f|
      f.params['email'] = friend_email
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
