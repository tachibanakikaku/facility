require 'spec_helper'

describe User do
  subject { User.new }

  it { expect(subject).to be_an_instance_of User }

  describe "association" do
    it { expect(subject).to have_many(:shops).through(:shops_users) }
    it { expect(subject).to have_many(:rooms).through(:reservations) }
  end
end
