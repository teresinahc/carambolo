require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(
        :feeling => "Feeling",
        :description => "MyText"
      ),
      Entry.create!(
        :feeling => "Feeling",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", :text => "Feeling".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
