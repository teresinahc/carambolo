require 'rails_helper'

describe 'user information page', type: :feature do
  let(:user) do
    User.create!(
        name: "User Name",
        email: "valid@email.com",
        password: "strong@password"
    )
  end

  let(:user_login) { create(:user) }

  before do
    sign_in user_login
  end

  it 'display users information' do
    visit user_path(user)

    expect(page).to have_content 'User Name'
    expect(page).to have_content 'valid@email.com'
  end
end
