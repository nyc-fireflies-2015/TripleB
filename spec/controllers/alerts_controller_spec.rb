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

  describe "GET #show" do
    context 'alert is incomplete' do
      xit "renders the :show_incomplete template" do
        alert = create(:alert, status: 'incomplete')
        get :show, id: alert.id
        expect(response).to render_template :show_incomplete
      end
    end
    context 'alert is in progress' do
      it "renders the :show_in_progress template" do
        alert = create(:alert, status: 'in progress')
        get :show, id: alert.id
        expect(response).to render_template :show_in_progress
      end
    end
    context 'alert is complete' do
      xit "renders the :show_complete template" do
        alert = create(:alert, status: 'complete')
        get :show, id: alert.id
        expect(response).to render_template :show_complete
      end
    end
  end

  describe "POST #create" do
    before :each do
      user = create(:user)
      stub_current_user user
      session[:user_id] = user.id
    end

    context "with valid attributes" do
      it "saves a new alert in the database" do
        expect {
          post :create, alert: attributes_for(:alert)
        }.to change(Alert, :count).by(1)
      end
      it "redirects to the alert's show page" do
        post :create, alert: attributes_for(:alert)
        expect(response).to redirect_to Alert.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save a new alert in the database' do
        expect {
          post :create, alert: attributes_for(:alert, description: nil)
        }.to change(Alert, :count).by(0)
      end
      it 'redirects to the new alert page' do
        post :create, alert: attributes_for(:alert, description: nil)
        expect(response).to redirect_to new_alert_path
      end
    end
  end
end
