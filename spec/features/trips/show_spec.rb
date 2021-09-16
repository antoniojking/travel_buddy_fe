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
        expect(page).to have_content('Trip Name')
        expect(page).to have_content('National Park Name')
        expect(page).to have_content('Travel Dates')
      end

      describe 'Weather' do
        #call on weather api facade
        it 'displays a weather forecast section' do
          within "#weather" do
            expect(page).to have_content('Weather Forecast')
            # expect(page).to have_content()
            # expect(page).to have_field()
            # expect(page).to have_button()
          end
        end
      end

      describe 'Accommodations' do
        it 'displays an accommodations section' do
          within "#accommodations" do
            expect(page).to have_content('Accommodations')
            # expect(page).to have_content()
            # expect(page).to have_field()
            expect(page).to have_button('Edit')
          end
        end

        it 'has a form to add a reservation'
        it 'has a button to edit details of an existing reservation'
      end

      describe 'Activites' do
        it 'displays an activities section' do
          within "#activities" do
            expect(page).to have_content('Activities')
            # expect(page).to have_content()
            # expect(page).to have_field()
            expect(page).to have_button('Edit')
          end
        end

        it 'has a form to add an activity'
        it 'has a button to edit detail of an existing activity'
      end

      describe 'Trip Checklists' do
        # trip1 = Trip.create(name: 'Rocky Mountain NP')
        checklist1 = 'Camping Supplies'
        checklist2 = 'Snacks'
        # checklist1 = trip1.checklists.create(name: checklist1)

        it 'displays a trip checklists section' do
          within "#checklists" do
            expect(page).to have_content('Trip Checklist(s)')
            expect(page).to have_link(checklist1)
            expect(page).to have_link(checklist2)

            # trip1.checklists.each do |checklist|
            #   expect(page).to have_link(checklist)
            # end
          end
        end

        it 'has a form to create new checklists' do
          within "#checklists" do
            expect(page).to have_field(:name)
            expect(page).to have_button('Create Checklist')
          end
        end

        context 'when I fill in the checklist name field and click on the create checklist button' do
          it 'adds the created checklist to the list as a link' do
            checklist3 = 'Personal Luggage'

            within "#checklists" do

              fill_in :name, with: checklist3
              click_button 'Create Checklist'

              expect(page).to have_link(checklist3)
            end
          end

          context 'when I click on the checklist link' do
            it 'redirects me to the checklist show page' do
              click_link(checklist1)

              expect(current_path).to eq("/trip_dashboard/checklists/#{checklist1.id}")
            end
          end
        end
      end

      describe 'Chat' do
        it 'displays a message board section' do
          author1 = 'antonio.j.king@gmail.com'
          author2 = 'elliotolbright@gmail.com'
          message1 = "Who is picking up Matt from the Airport?"
          message2 = "Not me"

          within "#chat" do
            expect(page).to have_content('Message Board/Chat')
            expect(page).to have_content(author1)
            expect(page).to have_content(message1)
            expect(page).to have_content(author2)
            expect(page).to have_content(message2)
            # expect(page).to have_field()
            # expect(page).to have_button()
          end
        end

        it 'has to a form to add a message to the chat feed'
      end

      describe 'Joining Freinds' do
        it 'displays a friends joining section' do
          within "#friends_joining" do
            expect(page).to have_content('Friends Joining')
            # expect(page).to have_content()
            # expect(page).to have_field()
            # expect(page).to have_button()
          end
        end

        it 'has a form to invite friends to join the trip'
      end
    end
  end
end
