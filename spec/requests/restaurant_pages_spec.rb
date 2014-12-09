require 'spec_helper'

describe "Restaurant Pages" do

  subject { page }

  describe "index" do
    before do
      visit restaurants_path
    end

    it { should have_title('All restaurants') }
    it { should have_content('All restaurants') }

    it "should list each restaurant" do
      Restaurant.all.each do |restaurant|
        expect(page).to have_selector('li', text: restaurant.name)
      end
    end
  end

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
        expect { click_button submit }.not_to change(Restaurant, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Restaurant"
        fill_in "Phone",        with: "03-1111-2222"
        fill_in "Address",      with: "tokyo,shinagawa city"
      end

      it "should create a restaurant" do
        expect { click_button submit }.to change(Restaurant, :count).by(1)
      end
    end
  end

  describe "edit" do
    let(:restaurant) { FactoryGirl.create(:restaurant) }
    before { visit edit_restaurant_path(restaurant) }

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit restaurant") }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content("error") }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_phone) { "new@example.com" }
      let(:new_address) { "newtokyo, shinagawa city" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Phone",            with: new_phone
        fill_in "Address",         with: new_address
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector("div.alert.alert-success") }
      specify { expect(restaurant.reload.name).to  eq new_name }
      specify { expect(restaurant.reload.phone).to eq new_phone }
      specify { expect(restaurant.reload.address).to eq new_address }
    end
  end
end
