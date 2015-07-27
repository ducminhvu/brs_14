require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "GET #index" do
    it "renders the list user" do
      get :index

      expect(response).to render_template("index")
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    let(:user) {FactoryGirl.create :user}
    it "render user" do
      get :show, id: user.id
      expect(response).to render_template("show")
    end
  end
end
