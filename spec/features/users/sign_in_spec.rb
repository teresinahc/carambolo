describe "the signin process", type: :feature do
  before :each do
    User.create!(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    visit '/users/sign_in'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Success'
  end
end
