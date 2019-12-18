require "rails_helper"

RSpec.describe "entries/new", type: :view do
  include Devise::Test::ControllerHelpers
  let(:user) { create(:user) }

  before(:each) do
    assign(:entry, build(:entry))
    sign_in user
    allow(view).to receive(:current_user).and_return(user)
  end

  it "renders new entry form" do
    render

    assert_select "form[action=?][method=?]", entries_path, "post" do

      assert_select "select[name=?]", "entry[feeling]"

      assert_select "textarea[name=?]", "entry[description]"
    end
  end
end
