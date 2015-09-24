require 'rails_helper'

describe AlertsController do
  describe "GET #index" do
    before :each do

    end
    it "populates with an array of alerts" do
      user = create(:user)
      session[:user_id] = user.id
      user_location = create(:location, latitude: 40.706392, longitude: -74.00912454, locatable_id: user.id, locatable_type: user.class)
      alert1 = create(:alert)
      location1 = create(:location, latitude: 40.7063951, longitude: -74.00912459999999, locatable_id: alert1.id, locatable_type: alert1.class)
      alert2 = create(:alert)
      location2 = create(:location, latitude: 40.7063932, longitude: -74.009124524, locatable_id: alert2.id, locatable_type: alert2.class)
      get :index
      expect(assigns(:alerts)).to match_array([alert1, alert2])
    end

    it "renders the :index template" do
      user = create(:user)
      session[:user_id] = user.id
      user_location = create(:location, latitude: 40.706392, longitude: -74.00912454, locatable_id: user.id, locatable_type: user.class)
      alert1 = create(:alert)
      location1 = create(:location, latitude: 40.7063951, longitude: -74.00912459999999, locatable_id: alert1.id, locatable_type: alert1.class)
      alert2 = create(:alert)
      location2 = create(:location, latitude: 40.7063932, longitude: -74.009124524, locatable_id: alert2.id, locatable_type: alert2.class)
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
      it "renders the :show_incomplete template" do
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
      it "renders the :show_complete template" do
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
          post :create, alert: attributes_for(:alert), location: attributes_for(:location)
        }.to change(Alert, :count).by(1)
      end
      it "redirects to the alert's show page" do
        post :create, alert: attributes_for(:alert), location: attributes_for(:location)
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

  describe "PATCH #update" do
    context 'user is a mechanic' do
      context 'alert is incomplete' do

        it 'changes the alert status to in progress' do
          @alert = create(:alert, status: "incomplete")
          mechanic = create(:user)
          patch :update, id: @alert, alert: attributes_for(:alert,
          status: "in progress"), receipt: attributes_for(:receipt, mechanic_id: mechanic.id), mechanic: attributes_for(:location)
          @alert.reload
          expect(@alert.status).to eq("in progress")
        end

        it 'redirects to the updated alert' do
          mechanic = create(:user)
          @alert = create(:alert, status: "incomplete")
          patch :update, id: @alert, alert: attributes_for(:alert,
            status: "in progress"), receipt: attributes_for(:receipt, mechanic_id: mechanic.id), mechanic: attributes_for(:location)
          expect(response).to redirect_to @alert
        end

      end

      context 'alert is in progress' do
        context "mechanic is the alert's mechanic" do
          it 'changes the alert status back to incomplete' do
            @mechanic = create(:user)
            @alert = create(:alert, status: 'in progress')
            patch :update, id: @alert, alert: attributes_for(:alert, status: 'incomplete')
            @alert.reload
            expect(@alert.status).to eq("incomplete")
          end
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
        @alert = create(:alert)
    end

    it 'deletes the alert' do
      expect{delete :destroy, id: @alert.id}.to change(Alert, :count).by -1
    end

    it 'redirects to index' do
      delete :destroy, id: @alert.id
      expect(response).to redirect_to alerts_path
    end
  end
end
