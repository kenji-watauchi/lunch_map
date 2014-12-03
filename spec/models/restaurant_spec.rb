require 'spec_helper'

describe Restaurant do

  before { @restaurant = Restaurant.new(name: "Exmple restaurant", phone: "03-1111-2222", address: "totyo,shinagawa city" ) }

  subject { @restaurant }

  #存在テスト
  it { should respond_to(:name) }
  it { should respond_to(:phone) }
  it { should respond_to(:address) }

  it { should be_valid }

  describe "when name is not present" do
    before { @restaurant.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @restaurant.name = "a" * 51 }
    it { should_not be_valid }
  end



  describe "when phone is not present" do
    before { @restaurant.phone = " " }
    it { should_not be_valid }
  end

  describe "when address is not present" do
    before { @restaurant.address = " " }
    it { should_not be_valid }
  end
end
