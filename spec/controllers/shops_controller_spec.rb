require 'spec_helper'

describe ShopsController do

  let(:valid_attributes) { { name: Faker::Company.name } }
  let(:valid_session) { {} }

  before do
    login_user
  end

  describe "GET index" do
    it "assigns all shops as @shops" do
      shop = Shop.create! valid_attributes
      get :index, {}, valid_session
      assigns(:shops).should eq([shop])
    end
  end

  describe "GET show" do
    it "assigns the requested shop as @shop" do
      shop = Shop.create! valid_attributes
      get :show, { id: shop.to_param }, valid_session
      assigns(:shop).should eq(shop)
    end
  end

  describe "GET new" do
    it "assigns a new shop as @shop" do
      get :new, {}, valid_session
      assigns(:shop).should be_a_new(Shop)
    end
  end

  describe "GET edit" do
    it "assigns the requested shop as @shop" do
      shop = Shop.create! valid_attributes
      get :edit, { id: shop.to_param }, valid_session
      assigns(:shop).should eq(shop)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Shop" do
        expect {
          post :create, { shop: valid_attributes }, valid_session
        }.to change(Shop, :count).by(1)
      end

      it "assigns a newly created shop as @shop" do
        post :create, { shop: valid_attributes }, valid_session
        assigns(:shop).should be_a(Shop)
        assigns(:shop).should be_persisted
      end

      it "redirects to the created shop" do
        post :create, { shop: valid_attributes }, valid_session
        response.should redirect_to(Shop.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shop as @shop" do
        Shop.any_instance.stub(:save).and_return(false)
        post :create, { shop: { name: "invalid value" } }, valid_session
        assigns(:shop).should be_a_new(Shop)
      end

      it "re-renders the 'new' template" do
        Shop.any_instance.stub(:save).and_return(false)
        post :create, { shop: { name: "invalid value" } }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested shop" do
        shop = Shop.create! valid_attributes
        Shop.any_instance \
          .should_receive(:update_attributes) \
          .with({ "name" => "MyString" })
        put :update, { id: shop.to_param, shop: { name: "MyString" } }, valid_session
      end

      it "assigns the requested shop as @shop" do
        shop = Shop.create! valid_attributes
        put :update, { id: shop.to_param, shop: valid_attributes }, valid_session
        assigns(:shop).should eq(shop)
      end

      it "redirects to the shop" do
        shop = Shop.create! valid_attributes
        put :update, { id: shop.to_param, shop: valid_attributes }, valid_session
        response.should redirect_to(shop)
      end
    end

    describe "with invalid params" do
      it "assigns the shop as @shop" do
        shop = Shop.create! valid_attributes
        Shop.any_instance.stub(:save).and_return(false)
        put :update, { id: shop.to_param, shop: { name: "invalid value" } }, valid_session
        assigns(:shop).should eq(shop)
      end

      it "re-renders the 'edit' template" do
        shop = Shop.create! valid_attributes
        Shop.any_instance.stub(:save).and_return(false)
        put :update, { id: shop.to_param, shop: { name: "invalid value" } }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested shop" do
      shop = Shop.create! valid_attributes
      expect {
        delete :destroy, { id: shop.to_param }, valid_session
      }.to change(Shop, :count).by(-1)
    end

    it "redirects to the shops list" do
      shop = Shop.create! valid_attributes
      delete :destroy, { id: shop.to_param }, valid_session
      response.should redirect_to(shops_url)
    end
  end

end
