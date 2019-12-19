require "rails_helper"

RSpec.describe 'form', type: :feature do
  describe 'submit a form' do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit new_entry_path

      fill_in "Feeling", with: 'neutral'
      fill_in "Description", with: 'example'
      fill_in "Hour", with: '12:32'
      click_on 'Create Entry'
    end

    context "submit a form succesfully" do
      it "redirect to correct page" do
        expect(page.current_path).to eq(entry_path(id: Entry.last.id))
      end

      it "render correct message" do
        expect(page).to have_content("Entry was successfully created.")
      end
    end
  end
end
