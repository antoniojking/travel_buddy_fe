require 'rails_helper'

RSpec.describe 'Welcome page' do
  before :each do
    visit root_path
  end
  it 'is on the correct page' do
    expect(current_path).to eq(root_path)
  end 
  it 'redirects to spotify login when I click the login button'
  it 'redirects to the user dashboard after the user has been authenticated'

  # How does Oauth work in FE compared to BE?
  # - does FE app need to add a gem for this?
  # - omniauth
  # -
  #
  #
  #

end
