require 'rails_helper'

describe 'user information page', type: :feature do
  let(:user) do
    User.create!(
        name: "Joseph Matheus",
        email: "valid@email.com",
        password: "strong@password333"
    )
  end

  it 'display users information' do
    visit user_path(user)

    expect(page).to have_content 'Joseph Matheus'
    expect(page).to have_content 'valid@email.com'
  end
end