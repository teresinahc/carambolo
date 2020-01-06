require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /home" do
    it "returns the correct response code" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
