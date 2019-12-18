require "rails_helper"

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, create(:user, name: 'Nicolas Gleiser', email: 'valid@email.com'))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nicolas Gleiser/)
    expect(rendered).to match(/valid@email.com/)
  end
end
