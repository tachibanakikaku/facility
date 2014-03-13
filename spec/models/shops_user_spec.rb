require 'spec_helper'

describe ShopsUser do
  subject { ShopsUser.new }

  it { expect(subject).to be_an_instance_of ShopsUser }

  describe "association" do
    it { expect(subject).to belong_to(:shop) }
    it { expect(subject).to belong_to(:user) }
  end
end
