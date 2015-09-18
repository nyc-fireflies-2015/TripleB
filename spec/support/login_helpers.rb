module LoginHelpers

  def log_in(user)
    visit root_path
    first('nav').click_link("Login")
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
  end

end