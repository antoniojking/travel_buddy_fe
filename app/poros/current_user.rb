class CurrentUser
  attr_reader :id,
              :email,
              :current_trips,
              :upcoming_trips,
              :past_trips,
              :friends

  def initialize(current_user_info)
    @id =             current_user_info[:id]
    @email =          current_user_info[:attributes][:email]
    @current_trips =  current_user_info[:attributes][:current_trips]
    @upcoming_trips = current_user_info[:attributes][:upcoming_trips]
    @past_trips =     current_user_info[:attributes][:past_trips]
    @friends =        current_user_info[:attributes][:friends]
  end
end
