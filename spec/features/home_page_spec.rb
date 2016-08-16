require 'rails_helper'
require_relative '../support/new_login_form'
require_relative "../support/new_credit_card_form"

feature 'home page' do
  let(:sign_in_form) { NewLoginForm.new }

  let(:user) { FactoryGirl.build(:user) }

  let(:credit_card_form) { NewCreditCardForm.new }

  before(:each) do
    @article = FactoryGirl.create(:article)
    @article_premium = Article.create(name: "Premium", premium: true, content:" hello")
  end

  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content("Hello World!")
  end

  scenario 'Click Free content' do
    visit("/")
    click_on(@article.name)
    expect(page).to_not have_css('.alert')
  end

  scenario 'Click Premium content' do
    visit("/")
    click_on(@article_premium.name)
    expect(page).to have_css('.alert')
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

  feature "log in" do
    before do
      sign_in_form.visit_page.fill_in_with(email: user.email).submit
    end

    scenario "Sign in", js: true do
      expect(page).to have_content("@email.com")
    end

    feature "Credit Card", js: true do

      scenario 'Illegal Credit Card' do
        credit_card_form.visit_page(user).fill_in_with(card_number: "4000000000000127").submit
        expect(page).to have_css(".alert")
      end

      scenario "Register Credit Card" do
       credit_card_form.visit_page(user).fill_in_with.submit
       expect(page).to have_content("Cancel Subscription")
      end

      scenario "Cancel Credit Card" do
       credit_card_form.visit_page(user).fill_in_with.submit
       click_on("Cancel Subscription")
       expect(page).to have_css(".alert")
      end

   end
    
  end

end
