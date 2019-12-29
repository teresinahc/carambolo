require 'rails_helper'

RSpec.describe "entries/edit", type: :view do
  before(:each) do
    @entry = assign(:entry, create(:entry))
  end

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

      assert_select "select[name=?]", "entry[feeling]"

      assert_select "textarea[name=?]", "entry[description]"
    end
  end
end
