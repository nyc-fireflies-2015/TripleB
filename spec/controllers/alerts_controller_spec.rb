require 'rails_helper'

RSpec.describe AlertsController, type: :controller do

  describe "GET #show" do
    let!(:alert) { FactoryGirl.create(:alert) }

    before :each do
      get :show, id: alert.id
    end

    context 'user is not logged in' do
    end

    context 'user is logged in' do
      it "assigns the requested alert to @alert" do
        expect(assigns(:alert)).to eq alert
      end
      it "renders the :show template" do
        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:alert) { FactoryGirl.create(:alert)}

    context 'user is not logged in' do
    end

    context 'user is logged in' do
      it "assigns an empty alert to @alert" do
        login(user)
        get :new
        expect(assigns(user.alert)).to be_a_new Alert
      end
      it "renders the :new template" do
        login(user)
        get :new
        expect(response).to render_template :new
      end
    end
  end

end
