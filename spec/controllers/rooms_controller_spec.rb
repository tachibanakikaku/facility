require 'spec_helper'

describe RoomsController do

  let(:valid_attributes) { { name: Faker::Company.name } }
  let(:valid_session) { {} }

  before do
    login_user
  end

  describe "GET index" do
    it "assigns all rooms as @rooms" do
      room = Room.create! valid_attributes
      get :index, {}, valid_session
      assigns(:rooms).should eq([room])
    end
  end

  describe "GET show" do
    it "assigns the requested room as @room" do
      room = Room.create! valid_attributes
      get :show, { id: room.to_param }, valid_session
      assigns(:room).should eq(room)
    end
  end

  describe "GET new" do
    it "assigns a new room as @room" do
      get :new, {}, valid_session
      assigns(:room).should be_a_new(Room)
    end
  end

  describe "GET edit" do
    it "assigns the requested room as @room" do
      room = Room.create! valid_attributes
      get :edit, { id: room.to_param }, valid_session
      assigns(:room).should eq(room)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, { room: valid_attributes }, valid_session
        }.to change(Room, :count).by(1)
      end

      it "assigns a newly created room as @room" do
        post :create, { room: valid_attributes }, valid_session
        assigns(:room).should be_a(Room)
        assigns(:room).should be_persisted
      end

      it "redirects to the created room" do
        post :create, { room: valid_attributes }, valid_session
        response.should redirect_to(Room.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved room as @room" do
        Room.any_instance.stub(:save).and_return(false)
        post :create, { room: { name: "invalid value" } }, valid_session
        assigns(:room).should be_a_new(Room)
      end

      it "re-renders the 'new' template" do
        Room.any_instance.stub(:save).and_return(false)
        post :create, { room: { name: "invalid value" } }, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested room" do
        room = Room.create! valid_attributes
        Room.any_instance \
          .should_receive(:update_attributes) \
          .with({ "name" => "MyString" })
        put :update, { id: room.to_param, room: { name: "MyString" } }, valid_session
      end

      it "assigns the requested room as @room" do
        room = Room.create! valid_attributes
        put :update, { id: room.to_param, room: valid_attributes }, valid_session
        assigns(:room).should eq(room)
      end

      it "redirects to the room" do
        room = Room.create! valid_attributes
        put :update, { id: room.to_param, room: valid_attributes }, valid_session
        response.should redirect_to(room)
      end
    end

    describe "with invalid params" do
      it "assigns the room as @room" do
        room = Room.create! valid_attributes
        Room.any_instance.stub(:save).and_return(false)
        put :update, { id: room.to_param, room: { name: "invalid value" } }, valid_session
        assigns(:room).should eq(room)
      end

      it "re-renders the 'edit' template" do
        room = Room.create! valid_attributes
        Room.any_instance.stub(:save).and_return(false)
        put :update, { id: room.to_param, room: { name: "invalid value" } }, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested room" do
      room = Room.create! valid_attributes
      expect {
        delete :destroy, { id: room.to_param }, valid_session
      }.to change(Room, :count).by(-1)
    end

    it "redirects to the rooms list" do
      room = Room.create! valid_attributes
      delete :destroy, { id: room.to_param }, valid_session
      response.should redirect_to(rooms_url)
    end
  end

end
