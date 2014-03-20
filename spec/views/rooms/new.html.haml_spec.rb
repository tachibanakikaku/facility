require 'spec_helper'

describe "rooms/new" do
  before(:each) do
    assign(:room, stub_model(Room, name: "A Room").as_new_record)
    assign(:shops, [stub_model(Shop, name: "A Shop").as_new_record])
  end

  it "renders new room form" do
    render

    assert_select "form[action=?][method=?]", rooms_path, "post" do
      assert_select "input#room_name[name=?]", "room[name]"
    end
  end
end
