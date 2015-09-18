require 'rails_helper'

describe SessionsController  do

  describe "GET #new" do
    it "renders login form" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
  end

  describe "DELETE #destroy" do
  end

end