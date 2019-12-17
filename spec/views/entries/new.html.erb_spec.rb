require 'rails_helper'

RSpec.describe "entries/new", type: :view do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    assign(:entry, build(:entry))
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
