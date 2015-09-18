require 'rails_helper'

describe SessionsController  do

  describe "GET #new" do
    it "redirects to login form" do
      get :new
      expect(response).to redirect_to login_path
    end
  end

  describe "POST #create" do
  end

  describe "DELETE #destroy" do
  end

end