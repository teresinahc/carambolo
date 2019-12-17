require 'rails_helper'

RSpec.describe "entries/edit", type: :view do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    @entry = assign(:entry, create(:entry))
    # sign_in :user
    allow(view).to receive(:current_user).and_return(user)
  end

  it "renders the edit entry form" do
    render

    assert_select "form[action=?][method=?]", entry_path(@entry), "post" do

      assert_select "select[name=?]", "entry[feeling]"

      assert_select "textarea[name=?]", "entry[description]"
    end
  end
end
