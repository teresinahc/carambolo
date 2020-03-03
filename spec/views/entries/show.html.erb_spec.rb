require "rails_helper"

RSpec.describe "entries/show", type: :view do
  let(:entry) { create(:entry, feeling: :sad, description: 'MyText') }
  before(:each) do
    @entry = assign(:entry, entry)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sad/)
    expect(rendered).to match(/MyText/)
  end
end
