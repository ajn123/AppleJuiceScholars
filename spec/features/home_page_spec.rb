require 'rails_helper'
require_relative '../support/new_login_form'

feature 'home page' do
  let(:sign_in_form) { NewLoginForm.new }

  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content("Hello World!")
  end

  scenario 'Correct sign up' do
    sign_in_form.visit_page.fill_in_with.submit
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario 'Wrong sign up' do
    sign_in_form.visit_page.fill_in_with(
      password: "INCORRECT PASSWORD"
    ).submit
    expect(page).to have_content("Password confirmation doesn't match Password Email Password")
  end

  scenario 'Click Premium content' do
    visit(root_path)
    click_on('Hello')
  end


  scenario "Sign in" do
    
  end

end
