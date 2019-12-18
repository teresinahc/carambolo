require "rails_helper"

RSpec.describe "entries/new", type: :view do
  before do
    assign(:entry, build(:entry))
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "select[name=?]", "entry[feeling]"

      assert_select "textarea[name=?]", "entry[description]"
    end
  end
end
