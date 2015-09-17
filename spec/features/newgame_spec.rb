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
    click_button "Go"
    expect(page).to have_content "Welcome harry!"
  end

  scenario "I am redirected if I don't input a name" do
    visit '/new_player'
    click_button 'Go'
    expect(page).to have_content "Please enter your name."
  end

  scenario 'We get to the new game page' do
    visit '/new_player'
    fill_in 'name', :with => 'harry'
    click_button "Go"
    click_link 'Click here to start a game!'
    expect(page).to have_content "Aircraft Carrier"
  end


end