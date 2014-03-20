require 'spec_helper'

describe Reservation do
  subject { Reservation.new }

  it { expect(subject).to be_an_instance_of Reservation }
end
