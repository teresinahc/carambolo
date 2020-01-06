require "rails_helper"

RSpec.describe 'form', type: :feature do
  describe 'submit a form' do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit new_entry_path

      select "Feliz", from: 'entry_feeling'
      fill_in "Descrição", with: 'example'
      fill_in "Hora", with: '12:32'
      click_on 'Criar Entrada'
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
