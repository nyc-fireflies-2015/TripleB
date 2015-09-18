require 'rails_helper'

describe SessionsController  do

  describe "GET #new" do
    it "renders login form" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "creates a user session" do
      user = create(:user)
      post :create, :username => user.username, :password => user.password
      expect(response).to redirect_to alerts_path
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "DELETE #destroy" do
    it "logs a user out" do

    end
  end

end