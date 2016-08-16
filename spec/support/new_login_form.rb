class NewLoginForm 
  include Capybara::DSL

  def visit_page
    visit("/")
    click_on('Sign Up', match: :first)
    self
  end

  def submit
    click_on('Create Account', match: :first)
    self
  end

  def fill_in_with(params = {})
    fill_in('Email', with: params.fetch(:email, with: 'email@email.com'))
    fill_in('Password', with: params.fetch(:password, 'password'))
    fill_in('Password confirmation', with: 'password')
    self
  end

  def login_as(user)  
    visit("/")
    click_on("Sign In")
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_on("Log in")
    self
  end

end
