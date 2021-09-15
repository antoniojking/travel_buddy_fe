require 'rails_helper'

RSpec.describe 'Explore Page' do 
  before :each do 
    visit explore_index_path
  end
  it 'is on the right page' do 
    
    expect(current_path).to eq(explore_index_path)
  end 
end