require 'rails_helper'

describe UsersController do

  describe 'GET #new' do
    before :each do
      @user = create(:user)
      get :new
    end

    it "assigns a new user" do
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders signup form" do
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
      session[:user_id] = @user.id
      get :show, id: @user.id
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before :each do
      @user = create(:user)
      session[:user_id] = @user.id
      get :edit, id: @user.id
    end

    it 'assigns the requested user to @user' do
      expect(assigns(:user)).to eq @user
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before :each do
      @user = create(:user, first_name: 'John')
      session[:user_id] = @user.id
      get :edit, id: @user
    end

    it 'updates a user\'s attributes' do
      patch :update, id: @user.id, user: attributes_for(:user, first_name: 'Billy')
      @user.reload
      expect(@user.first_name).to eq 'Billy'
    end

    it 'redirects to the user\'s profile' do
      patch :update, id: @user.id, user: attributes_for(:user)
      @user.reload
      expect(response).to redirect_to @user
    end
  end
end