require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "renders the home page" do
      get root_path

      expect(response).to be_successful
    end
  end
end
