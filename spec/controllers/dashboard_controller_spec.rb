require 'spec_helper'

describe DashboardController do

  before do
    login_user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
