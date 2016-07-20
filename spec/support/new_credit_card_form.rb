class NewCreditCardForm
  include Capybara::DSL



  def visit_page
    visit("/users/info")
    self
  end


  def fill_in_with(params = {})
    fill_in("Card Number", with: "4242424242424242")
    fill_in("CVC", with: "123")
    fill_in("MM", with: "01")
    fill_in("YYYY", with: "2020")
    self
  end


  def submit
    click_on("Create Subscription")
    self
  end

end
