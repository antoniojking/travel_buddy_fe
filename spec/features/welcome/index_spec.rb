require 'rails_helper'

RSpec.describe 'Welcome page' do 
  before :each do 
    visit root_path
  end
  it 'is on the right page' do 
    

    expect(current_path).to eq(root_path)
  end 
end