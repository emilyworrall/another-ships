require 'spec_helper'

feature 'Starting a new game' do
  
  scenario 'I am asked to enter my name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
  end

  scenario 'I enter my name' do
    visit '/new_player'
    fill_in 'name', :with => 'harry'
    click_button "Submit"
    expect(page).to have_content "Welcome harry!"
  end
end