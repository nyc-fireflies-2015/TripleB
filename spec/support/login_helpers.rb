module LoginHelpers

  def log_in(user)
    visit root_path
    first('#login_header').click_link("Login")
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
  end

end