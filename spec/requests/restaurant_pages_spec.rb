require 'spec_helper'

describe "Restaurant Pages" do

  subject { page }

  describe "profile page" do
    let(:restaurant) { FactoryGirl.create(:restaurant) }
    before { visit restaurant_path(restaurant) }

    it { should have_content(restaurant.name) }
    it { should have_title(restaurant.name) }
  end

  describe "signup page" do
    before { visit signup2_path }

    it { should have_content('登録') }
    it { should have_title(full_title('店舗登録')) }
  end

  describe "signup" do

    before { visit signup2_path }

    let(:submit) { "新規登録" }

    describe "with invalid information" do
      it "should not create a restaurant" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Phone",        with: "03-1111-2222"
        fill_in "Address",      with: "tokyo,shinagawa city"
      end

      it "should create a restaurant" do
        expect { click_button submit }.to change(Restaurant, :count).by(1)
      end
    end
  end
end
