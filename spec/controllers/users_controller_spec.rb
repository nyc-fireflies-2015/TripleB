require 'rails_helper'

describe UsersController do

  describe 'GET #new' do

    it "assigns a new user" do
      @user = create(:user)
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders signup form" do
      @user = create(:user)
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it "creates a new user with valid attributes" do
      expect{
          get :new
          post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it "redirects to alerts index page" do
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to alerts_path
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      @user = create(:user)
      get :show, id: @user.id
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      @user = create(:user)
      get :edit, id: @user
      expect(response).to render_template :edit
    end
  end

end