require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:users) { create_list(:user, 2)}

  before do
    assign(:users, users)
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => users[0].name
    assert_select "tr>td", :text => users[1].name
    assert_select "tr>td", :text => users[0].email
    assert_select "tr>td", :text => users[1].email
  end
end
