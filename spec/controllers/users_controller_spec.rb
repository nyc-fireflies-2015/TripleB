require 'rails_helper'

describe UsersController do
  before :each do
    @user = create(:user)
    session[:user_id] = @user.id

    describe 'GET #new' do
      it "assigns a new user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders signup form" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      it "creates a new user with valid attributes" do
        expect{
            get :new
            post :create, user: attributes_for(@user)
        }.to change(User, :count).by(1)
      end

      # it "redirects to alerts index page" do
      #   post :create, user: attributes_for(:user)
      #   expect(response).to redirect_to alerts_path
      # end
    end

    describe 'GET #edit' do
      it 'assigns the requested user to @user' do
        get :edit, id: @user.id
        expect(assigns(:user)).to eq @user
      end

      it 'renders the edit template' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @user = create(:user, first_name: 'Alex', last_name: 'Huang', username: 'alex62wp7c', email: 'ahuang62wp7c@gmail.com', phone: '415-298-1745', password: 'foo')
    end

    # it 'changes @users attributes' do
    #   patch :update, id: @user.id
    # end
  end

end