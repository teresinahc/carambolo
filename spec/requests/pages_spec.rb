require 'rails_helper'

RSpec.describe 'home page', type: :request do
  describe "GET /root" do
    it "works!" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
