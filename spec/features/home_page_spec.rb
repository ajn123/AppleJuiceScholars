
require 'rails_helper'


feature 'home page' do
  

  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content("Hello World!")
  end


  scenario 'Correct sign up' do
    visit('/')
    click_on('Sign Up')
    fill_in('Email', with: 'ajn123@vt.edu')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_on('Sign up')
    expect(page).to have_content("You have signed up successfully.")
  end
  scenario 'Wrong sign up' do
    visit('/')
    click_on('Sign Up')
    fill_in('Email', with: 'ajn123@vt.edu')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'WRONG PASSWORD')
    click_on('Sign up')
    expect(page).to have_content("Password confirmation doesn't match Password Email Password")
  end
end
