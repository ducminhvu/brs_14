require "rails_helper"

include Devise::TestHelpers

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    it "renders the books list" do
      expect(response).to render_template "index"
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status 200
    end
  end

  describe "GET #show" do
    let(:book) {FactoryGirl.create :book, :has_category, :page_is_number}
    it "render book show" do
      sign_in FactoryGirl.create :user
      get :show, id: book.id
      expect(response).to render_template "show"
    end
  end
end
