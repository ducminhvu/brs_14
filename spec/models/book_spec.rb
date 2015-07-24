require "rails_helper"

describe Book do
  context "check Book relation" do
    it {should belong_to :category}
    it {should have_many :reviews}
    it {should have_many :readings}
    it {should have_many :favorites}
  end
end

describe Book do
  context "check validation" do
    let(:book_category) {FactoryGirl.build :book, :hasnt_category, :page_is_number}
    let(:book_page) {FactoryGirl.build :book, :has_category, :page_isnt_number}
    it "check validate category is not nil" do
      expect(book_category).to_not be_valid
    end
    it "check validate number_page is number" do
      expect(book_page).to_not be_valid
    end
  end
end
