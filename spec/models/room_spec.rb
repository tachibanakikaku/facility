require 'spec_helper'

describe Room do
  subject { Room.new }

  it { expect(subject).to be_an_instance_of Room }

  describe "association" do
    it { expect(subject).to belong_to(:shop) }
    it { expect(subject).to have_many(:users).through(:reservations) }
  end
end
