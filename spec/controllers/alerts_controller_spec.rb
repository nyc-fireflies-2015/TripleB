require 'rails_helper'

describe AlertsController do
  describe "GET #index" do
    it "populates with an array of alerts" do
      alert1 = create(:alert)
      alert2 = create(:alert)
      get :index
      expect(assigns(:alerts)).to match_array([alert1, alert2])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new alert" do
      @alert = create(:alert)
      get :new
      expect(assigns(:alert)).to be_a_new(Alert)
    end
  end

  # describe "GET #show" do
  #   it "renders the :show template" do
  #     @alert = create(:alert)
  #     get :show, id: @alert.id
  #     expect(response).to render_template :show
  #   end
  # end


  # describe 'POST #create' do
  #   before :each do
  #     user = create(:user)
  #     stub_current_user user
  #     session[:user_id] = user.id
  #   end
  #   it "creates a new alert with valid attributes" do
  #     expect{
  #         get :new
  #         post :create, creator_id: 1, latitude: 0, longitude: 0, description: "test"
  #     }.to change(Alert, :count).by(1)
  #   end
  #   it "redirects to alerts index page" do
  #     post :create, creator_id: 1, latitude: 0, longitude: 0, description: "test"
  #     expect(response).to redirect_to alerts_path
  #   end
  # end

  # describe "DELETE #destroy" do
  #   before :each do
  #     @alert = create(:alert)
  #   end
  #   it "destroys an alert" do
  #     expect{
  #         delete :destroy, id: @alert.id
  #     }.to change(Alert, :count).by(-1)
  #   end
  #   it "redirects to alerts index page" do
  #     delete :destroy, id: @alert.id
  #     expect(response).to redirect_to alerts_path
  #   end
  # end

end
