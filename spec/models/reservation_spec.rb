require 'spec_helper'

describe Reservation do
  subject { Reservation.new }

  it { expect(subject).to be_an_instance_of Reservation }

  describe "association" do
    it { expect(subject).to belong_to(:room) }
    it { expect(subject).to belong_to(:user) }
  end
end
