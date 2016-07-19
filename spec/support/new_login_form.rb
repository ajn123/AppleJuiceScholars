class NewLoginForm 
  include Capybara::DSL

  def visit_page
    visit("/")
    click_on('Sign Up')
    self
  end


  def submit
    click_on('Sign up')
    self
  end

  def fill_in_with(params = {})
    fill_in('Email', with: 'ajn123@vt.edu')
    fill_in('Password', with: params.fetch(:password, 'password'))
    fill_in('Password confirmation', with: 'password')
    self
  end
end
