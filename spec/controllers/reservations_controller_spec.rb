require 'spec_helper'

describe ReservationsController do

  let(:password) { SecureRandom.uuid.delete "-" }
  let(:valid_session) { {} }

  before do
    login_user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index, {}, valid_session
      response.should be_success
    end

    it "assigns all users as @users" do
      get :index, {}, valid_session
      assigns(:users).should eq(User.all)
    end
  end
end
