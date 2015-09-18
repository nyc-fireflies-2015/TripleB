require 'rails_helper'

RSpec.describe AlertsController, type: :controller do

  describe "GET #show" do
    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
