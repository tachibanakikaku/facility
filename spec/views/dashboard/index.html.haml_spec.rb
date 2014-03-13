require 'spec_helper'

describe "dashboard/index.html.haml" do
  before(:each) { render }

  it "renders link to rooms menu" do
    assert_select "a", text: t("rooms.index.title"), count: 1
  end

  it "renders link to users menu" do
    assert_select "a", text: t("users.index.title"), count: 1
  end
end
