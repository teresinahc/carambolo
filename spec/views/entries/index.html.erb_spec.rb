require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  let(:entries) { create_list(:entry, 2)}

  before(:each) do
    assign(:entries, entries)
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", :text => entries[0].feeling
    assert_select "tr>td", :text => entries[0].description
    assert_select "tr>td", :text => entries[1].feeling
    assert_select "tr>td", :text => entries[1].description
  end
end
