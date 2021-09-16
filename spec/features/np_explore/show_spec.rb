require 'rails_helper' 

RSpec.describe 'Show Page' do
  before :each do
    visit explore_path(420)

  end
  
  it 'is on the right page' do 
    expect(current_path).to eq(explore_path(420))
  end 
end