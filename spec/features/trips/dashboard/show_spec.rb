require 'rails_helper'

RSpec.describe 'Trips dashboard page' do
  describe 'as an authenticated user' do
    # before do
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # end
    before :each do
      json_response = File.read('spec/fixtures/trips/dashboard/trip_new.json')
      stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6").
      to_return(status: 200, body: json_response)

      visit trips_dashboard_path(6)
    end

    describe "when I visit a trip's dashboard" do
      it 'displays trip attributes' do
        expect(page).to have_content("Michael's trip 1")
        expect(page).to have_content('Rocky Mountain National Park')
        expect(page).to have_content('Travel Dates')
      end

      describe 'Travel Dates' do
        it "displays the trip's start and end dates" do
          within "#travel-dates" do
            expect(page).to have_content("Start Date: TBD")
            expect(page).to have_content("End Date: TBD")
          end
        end

        it "displays a form to update the trip's start and/or end dates" do
          stub_request(:patch, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6?end_date=TBD&start_date=2008").
            to_return(status: 200)

          json_response = File.read('spec/fixtures/trips/dashboard/trip_update_start_date.json')
          stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6").
            to_return(status: 200, body: json_response)

          within "#travel-dates" do
            fill_in :start_date, with: 2021-11-02
            click_button 'Update start/end dates'
          end

          expect(page).to have_content("Start Date: 2021-11-02")
          expect(page).to have_content("End Date: TBD")

          stub_request(:patch, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6?end_date=2006&start_date=2021-11-02").
            to_return(status: 200, body: "", headers: {})

          json_response = File.read('spec/fixtures/trips/dashboard/trip_update_end_date.json')
          stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6").
            to_return(status: 200, body: json_response)

          within "#travel-dates" do
            fill_in :end_date, with: 2021-11-04
            click_button 'Update start/end dates'
          end

          expect(page).to have_content("Start Date: 2021-11-02")
          expect(page).to have_content("End Date: 2021-11-04")
        end
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
        it 'displays an accommodations section, which is empty when a trip is first created' do
          within "#accommodations" do
            expect(page).to have_content('Accommodations')
            expect(page).to have_button('Create')
            expect(page).not_to have_selector("#accommodation-1")
          end
        end

        it 'button can link to create new accommodation page' do
          click_button 'Create'

          expect(current_path).to eq(new_trips_dashboard_accommodation_path(6))
        end
        
        it 'lists the trips accommodation records, which link to their show page' do
          json_response = File.read('spec/fixtures/trips/dashboard/trip_accommodation_new.json')
          stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6").
            to_return(status: 200, body: json_response)

          visit trips_dashboard_path(6)

          json_response = File.read('spec/fixtures/trips/dashboard/accommodation_show.json')
          stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6/accommodations/1").
            to_return(status: 200, body: json_response)

          within "#accommodations" do
            within "#accommodation-1" do
              expect(page).to have_link('Camp 4')
              click_link('Camp 4')
            end
          end

          expect(current_path).to eq(trips_dashboard_accommodation_path(6, 1))
        end
      end

      describe 'Trip Checklists' do
        it 'displays a trip checklists section' do

          within "#checklists" do
            expect(page).to have_content('Trip Checklist(s)')
            expect(page).not_to have_selector("#checklist-1")
              # within "#checklist-1" do
              #   expect(page).to have_link('Blue Plate Grill')
              # end
          end
        end

        it 'has a form to create new checklists' do
          within "#checklists" do
            expect(page).to have_field(:category)
            expect(page).to have_button('Create Checklist')
          end
        end

        context 'when I fill in the checklist name field and click on the create checklist button' do
          it 'adds the created checklist to the list as a link' do
            stub_request(:post, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6/checklists?category=Personal%20Luggage&trip_id=6").
              to_return(status: 200)

            json_response = File.read('spec/fixtures/trips/dashboard/trip_checklist_new.json')
            stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6").
              to_return(status: 200, body: json_response)

            new_checklist = 'Personal Luggage'

            within "#checklists" do
              fill_in :category, with: new_checklist
              click_button 'Create Checklist'
            end

            expect(current_path).to eq(trips_dashboard_path(6))

            within "#checklists" do
              expect(page).to have_link(new_checklist)
            end
          end

          context 'when I click on the checklist link' do
            it 'redirects me to the checklist show page' do
              json_response = File.read('spec/fixtures/trips/dashboard/trip_checklist_new.json')
              stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6").
              to_return(status: 200, body: json_response)

              stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/6/checklists/1").
                with(
                  headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'User-Agent'=>'Faraday v1.8.0'
                  }).
                to_return(status: 200, body: json_response, headers: {})

              visit trips_dashboard_path(6)

              within "#checklist-1" do
                click_link('Personal Luggage')
              end

              expect(current_path).to eq(trips_dashboard_checklist_path(6,1))
            end
          end
        end
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

        xit 'has a form to invite friends to join the trip' do
        end
      end

      # describe 'Chat' do
      #   xit 'displays a message board section' do
      #     author1 = 'antonio.j.king@gmail.com'
      #     author2 = 'elliotolbright@gmail.com'
      #     message1 = "Who is picking up Matt from the Airport?"
      #     message2 = "Not me"
      #
      #     within "#chat" do
      #       expect(page).to have_content('Message Board/Chat')
      #       expect(page).to have_content(author1)
      #       expect(page).to have_content(message1)
      #       expect(page).to have_content(author2)
      #       expect(page).to have_content(message2)
      #       # expect(page).to have_field()
      #       # expect(page).to have_button()
      #     end
      #   end
      #
      #   xit 'has to a form to add a message to the chat feed' do
      #   end
      # end

      # describe 'Activites' do
      #   xit 'displays an activities section' do
      #     within "#activities" do
      #       expect(page).to have_content('Activities')
      #       # expect(page).to have_content()
      #       # expect(page).to have_field()
      #       expect(page).to have_button('Edit')
      #     end
      #   end
      #
      #   it 'has a form to add an activity'
      #   it 'has a button to edit detail of an existing activity'
      # end
    end
  end
end
