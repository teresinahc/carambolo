require 'rails_helper'

RSpec.describe "Entries", type: :request do
  let(:user) { create(:user) }

  describe "GET /entries" do
    let(:user) { create(:user) }
    let!(:user_entry) {
      create(:entry, user: user, description: 'Current User Entry') }
    let!(:other_entry) { create(:entry, description: 'Another Entry') }

    context "when user is not logged in" do
      it "redirects to login page" do
        get entries_path

        expect(response).to have_http_status(302)
      end
    end

    context "when user is logged in" do
      before do
        sign_in user
        get entries_path
      end

      it "returns a successful response" do
        expect(response).to have_http_status(200)
      end

      context "shows only the entries wich belong to the user" do
        it "shows the current user's entries" do
          subject = response.body.include?(user_entry.description)

          expect(subject).to be(true)
        end

        it "does not show the entries wich does not belong to the user" do
          subject = response.body.include?(other_entry.description)

          expect(subject).to be(false)
        end
      end
    end
  end

  describe "POST /entries" do
    let(:user) { create(:user) }
    let(:valid_attributes) { attributes_for(:entry) }

    before { sign_in user }

    it "creates an entry" do
      expect {
        post "/entries", params: { entry: valid_attributes }
      }.to change(Entry, :count).by(1)
    end

    it "creates an entry wich belongs to the current user" do
      post "/entries", params: { entry: valid_attributes }
      subject = Entry.last.user_id

      expect(subject).to be(user.id)
    end
  end
end
