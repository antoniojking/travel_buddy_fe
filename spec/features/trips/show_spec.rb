require 'rails_helper'

RSpec.describe 'Trips dashboard page' do
  describe 'as an authenticated user' do
    # let(:email) { 'funbucket13' }
    # let(:password) { 'test' }
    # let(:user) { User.create(email: email, password: password) }

    # before do
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # end

    describe 'when I visit the "/trip_dashboard" path' do
      before { visit '/trip_dashboard' }

      it 'displays trip attributes' do
        expect(current_path).to eq('/trip_dashboard')
        expect(page).to have_content("Trip Name")
        expect(page).to have_content("National Park Name")
        expect(page).to have_content("Travel Dates")
      end

      it 'displays a weather forecast section' do
        within "#weather" do
          expect(page).to have_content("Weather Forecast")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays an accommodations section' do
        within "#accommodations" do
          expect(page).to have_content("Accommodations")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays an activities section' do
        within "#activities" do
          expect(page).to have_content("Activities")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays a trip checklists section' do
        within "#checklists" do
          expect(page).to have_content("Trip Checklist(s)")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays a chat section' do
        within "#chat" do
          expect(page).to have_content("Message Board/Chat")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end

      it 'displays a friends joining section' do
        within "#friends_joining" do
          expect(page).to have_content("Friends Joining")
          # expect(page).to have_content()
          # expect(page).to have_field()
          # expect(page).to have_button()
        end
      end
    end
  end
end
