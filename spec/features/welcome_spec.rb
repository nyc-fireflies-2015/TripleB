require 'rails_helper'
include LoginHelpers

feature "User visits the site" do
  context "on landing page" do
    it "sees a login and signup link" do
      visit root_path
      expect(page).to have_content("Login")
      expect(page).to have_content("Sign Up")
    end
    it "can log in" do
      user = create(:user)
      log_in user
      expect(page).to have_content("Logout")
      #ZM: NO! Remove this commented out code, and this comment 
      # expect(page).not_to have_content("Login")
    end
  end

end