require 'rails_helper'

RSpec.describe 'Trips dashboard page' do
  describe 'as an authenticated user' do
    # before do
    #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # end
    before :each do
      visit trips_dashboard_path(6)
    end

    describe "when I visit a trip's dashboard" do
      xit 'displays trip attributes' do
        expect(current_path).to eq(trips_dashboard_path(17))
        expect(page).to have_content('Trip Name')
        expect(page).to have_content('National Park Name')
        expect(page).to have_content('Travel Dates')
      end

      describe 'Weather' do
        #call on weather api facade
        xit 'displays a weather forecast section' do
          within "#weather" do
            expect(page).to have_content('Weather Forecast')
            # expect(page).to have_content()
            # expect(page).to have_field()
            # expect(page).to have_button()
          end
        end
      end

      describe 'Accommodations' do
        xit 'displays an accommodations section' do
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
        xit 'displays an activities section' do
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
        before :each do
          # json_response = File.read('spec/fixtures/checklist_by_trip.json')
          # stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/17/checklists").
          # with(
          #  headers: {
          #   'Accept'=>'*/*',
          #   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          #   'User-Agent'=>'Faraday v1.7.2'
          #   }).
          # to_return(status: 200, body: json_response)

          visit trips_dashboard_path(6)
        end

        xit 'displays a trip checklists section' do
          within "#checklists" do
            expect(page).to have_content('Trip Checklist(s)')
              within "#checklist-1" do
                expect(page).to have_link('Blue Plate Grill')
                expect(page).to have_content('Blue Plate Grill | item count: 0')
              end
          end
        end

        xit 'has a form to create new checklists' do
          within "#checklists" do
            expect(page).to have_field(:name)
            expect(page).to have_button('Create Checklist')
          end
        end

        context 'when I fill in the checklist name field and click on the create checklist button' do
          xit 'adds the created checklist to the list as a link' do
            # json_response_new = File.read('spec/fixtures/checklist_create.json')
            # stub_request(:post, "https://travel-buddy-api.herokuapp.com/api/v1/trips/17/checklists").
            #   with(
            #     body: "{\"name\":\"Personal Luggage\",\"trip_id\":\"17\"}",
            #     headers: {
            #    'Accept'=>'*/*',
            #    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            #    'User-Agent'=>'Faraday v1.7.2'
            #     }).
            # to_return(status: 200, body: json_response_new)

            new_checklist = 'Personal Luggage'

            within "#checklists" do
              fill_in :name, with: new_checklist
              click_button 'Create Checklist'
            end

            json_response = File.read('spec/fixtures/checklist_by_trip_new.json')
            stub_request(:get, "https://travel-buddy-api.herokuapp.com/api/v1/trips/17/checklists").
            with(
             headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v1.7.2'
              }).
            to_return(status: 200, body: json_response)

            visit trips_dashboard_path(17)

            within "#checklists" do
              expect(page).to have_link(new_checklist)
            end
          end

          context 'when I click on the checklist link' do
            xit 'redirects me to the checklist show page' do
              within "#checklist-1" do
                click_link('Blue Plate Grill')
              end

              expect(current_path).to eq(trips_dashboard_checklist_path(17,37))
            end
          end
        end
      end

      describe 'Chat' do
        xit 'displays a message board section' do
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

        xit 'has to a form to add a message to the chat feed' do
        end
      end

      describe 'Joining Freinds' do
        xit 'displays a friends joining section' do
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
    end
  end
end
