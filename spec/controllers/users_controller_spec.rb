require 'spec_helper'

describe UsersController do

  let(:password) { SecureRandom.uuid.delete "-" }
  let(:user1) {
    User.create!(
                 name: Faker::Name.name,
                 email: Faker::Internet.email,
                 password: password,
                 password_confirmation: password
                 )
  }
  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password
    }
  }
  let(:valid_session) { {} }

  before do
    login_as(user1)
  end

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, {}, valid_session
      assigns(:users).should eq([user1])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, { id: user1.to_param }, valid_session
      assigns(:user).should eq(user1)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, { id: user1.to_param }, valid_session
      assigns(:user).should eq(user1)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, { user: valid_attributes }, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, { user: valid_attributes }, valid_session
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, { user: valid_attributes }, valid_session
        response.should redirect_to(User.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        User.any_instance.stub(:save).and_return(false)
        post :create, { user: { name: "invalid value" } }, valid_session
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        User.any_instance.stub(:save).and_return(false)
        post :create, { user: { name: "invalid value" } }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        User.any_instance \
          .should_receive(:update_attributes) \
          .with("name" => "new name")
        put :update, { id: user1.to_param, user: { name: "new name" } }, valid_session
      end

      it "assigns the requested user as @user" do
        put :update, { id: user1.to_param, user: valid_attributes }, valid_session
        assigns(:user).should eq(user1)
      end

      it "redirects to the user" do
        put :update, { id: user1.to_param, user: valid_attributes }, valid_session
        response.should redirect_to(user1)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        User.any_instance.stub(:save).and_return(false)
        put :update, { id: user1.to_param, user: { email: nil } }, valid_session
        assigns(:user).should eq(user1)
      end

      it "re-renders the 'edit' template" do
        User.any_instance.stub(:save).and_return(false)
        put :update, { id: user1.to_param, user: { name: "invalid value" } }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, { id: user.to_param }, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, { id: user.to_param }, valid_session
      response.should redirect_to(users_url)
    end
  end

end
