require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading)    { '五反田' }
    let(:page_title) { "" }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
  end

  describe "About page" do
    before { visit about_path }

    let(:heading)    { 'About' }
    let(:page_title) { 'About Us' }
  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "ユーザー登録"
    expect(page).to have_title(full_title('ユーザー登録'))
    click_link "店舗一覧"
    expect(page).to have_title(full_title(''))

    click_link "五反田ランチマップ！"
    expect(page).to have_title(full_title(''))
  end
end
