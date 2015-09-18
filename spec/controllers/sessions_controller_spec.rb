require 'rails_helper'
include AuthenticationHelpers

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
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "DELETE #destroy" do
    before :each do
      user = create(:user)
      stub_current_user user
      session[:user_id] = user.id
    end
    it "logs a user out" do
      delete :destroy, :id => session[:user_id]
      expect(response).to redirect_to root_path
      expect(session[:user_id]).to eq(nil)
    end
  end

end