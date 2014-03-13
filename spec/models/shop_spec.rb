require 'spec_helper'

describe Shop do
  subject { Shop.new }

  it { expect(subject).to be_an_instance_of Shop }

  describe "association" do
    it { expect(subject).to have_many(:users).through(:shops_users) }
  end
end
