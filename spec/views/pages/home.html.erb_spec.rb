require 'rails_helper'

RSpec.describe "home", type: :view do
  before do
    render
  end

  context "renders attributes in <p>" do
    it "expect correct text" do
      expect(rendered).to match(/Sobre/)
    end

    # it "expect correct text" do
    #   expect(rendered).to match(/MyText/)
    # end
  end
end
