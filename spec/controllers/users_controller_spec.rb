require 'rails_helper'

describe UsersController do
  describe 'user access' do
    before :each do
      @user = create(:user)
      session[:user_id] = @user.id
    end

    describe '#new' do
      it "assigns a new user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    describe '#create' do
      it "creates a new user with valid attributes" do
        get :new
        binding.pry
        post :create, user: @user_attributes
        expect(User.last.username).to eq(@user.username)
        expect(User.last.email).to eq(@user.email)
      end
    end

    # it "POST#create denies access" do
    #   post :create, user: attributes_for(:user)
    #   expect(response).to redirect_to root_url
    # end
  end
end