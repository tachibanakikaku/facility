require 'spec_helper'

describe EquipmentController do

  let(:valid_attributes) { { name: Faker::Product.product_name } }
  let(:valid_session) { {} }

  before do
    login_user
  end

  describe "GET index" do
    it "assigns all equipment as @equipment" do
      equipment = Equipment.create! valid_attributes
      get :index, {}, valid_session
      assigns(:equipment).should eq([equipment])
    end
  end

  describe "GET show" do
    it "assigns the requested equipment as @equipment" do
      equipment = Equipment.create! valid_attributes
      get :show, { id: equipment.to_param }, valid_session
      assigns(:equipment).should eq(equipment)
    end
  end

  describe "GET new" do
    it "assigns a new equipment as @equipment" do
      get :new, {}, valid_session
      assigns(:equipment).should be_a_new(Equipment)
    end
  end

  describe "GET edit" do
    it "assigns the requested equipment as @equipment" do
      equipment = Equipment.create! valid_attributes
      get :edit, { id: equipment.to_param }, valid_session
      assigns(:equipment).should eq(equipment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Equipment" do
        expect {
          post :create, { equipment: valid_attributes }, valid_session
        }.to change(Equipment, :count).by(1)
      end

      it "assigns a newly created equipment as @equipment" do
        post :create, { equipment: valid_attributes }, valid_session
        assigns(:equipment).should be_a(Equipment)
        assigns(:equipment).should be_persisted
      end

      it "redirects to the created equipment" do
        post :create, { equipment: valid_attributes }, valid_session
        response.should redirect_to(Equipment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved equipment as @equipment" do
        Equipment.any_instance.stub(:save).and_return(false)
        post :create, { equipment: { name: nil } }, valid_session
        assigns(:equipment).should be_a_new(Equipment)
      end

      it "re-renders the 'new' template" do
        Equipment.any_instance.stub(:save).and_return(false)
        post :create, { equipment:  { name: "invalid value" } }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested equipment" do
        equipment = Equipment.create! valid_attributes
        Equipment.any_instance \
          .should_receive(:update_attributes) \
          .with({ "name" => "MyString" })
        put :update, { id: equipment.to_param, equipment: { name: "MyString" } }, valid_session
      end

      it "assigns the requested equipment as @equipment" do
        equipment = Equipment.create! valid_attributes
        put :update, { id: equipment.to_param, equipment: valid_attributes }, valid_session
        assigns(:equipment).should eq(equipment)
      end

      it "redirects to the equipment" do
        equipment = Equipment.create! valid_attributes
        put :update, { id: equipment.to_param, equipment: valid_attributes }, valid_session
        response.should redirect_to(equipment)
      end
    end

    describe "with invalid params" do
      it "assigns the equipment as @equipment" do
        equipment = Equipment.create! valid_attributes
        Equipment.any_instance.stub(:save).and_return(false)
        put :update, { id: equipment.to_param, equipment: { name: "invalid value" } }, valid_session
        assigns(:equipment).should eq(equipment)
      end

      it "re-renders the 'edit' template" do
        equipment = Equipment.create! valid_attributes
        Equipment.any_instance.stub(:save).and_return(false)
        put :update, { id: equipment.to_param, equipment: { name: "invalid value" } }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested equipment" do
      equipment = Equipment.create! valid_attributes
      expect {
        delete :destroy, { id: equipment.to_param }, valid_session
      }.to change(Equipment, :count).by(-1)
    end

    it "redirects to the equipment list" do
      equipment = Equipment.create! valid_attributes
      delete :destroy, { id: equipment.to_param }, valid_session
      response.should redirect_to(equipment_index_url)
    end
  end

end
