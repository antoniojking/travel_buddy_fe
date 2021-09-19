require 'rails_helper'

RSpec.describe 'Welcome page' do
  before :each do
    visit root_path
  end

  # Happy Path
  # As a User, when I visit the home page,
  # I can login via my Spotify account on Spotify's login page. After logging in,
  # I am redirected to my dashboard page
  #
  # Sad Path
  # As a User, when I visit Spotify's login page but cannot login using my account, then the User must resolve the issue with Spotify before proceeding.

  it 'has a spotify login button' do
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Sign in with Spotify')
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
