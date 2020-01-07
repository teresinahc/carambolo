require "rails_helper"

RSpec.describe EntriesController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_attributes) {
    attributes_for(:entry, user_id: user.id)
  }

  let(:invalid_attributes) {
    attributes_for(:entry, user_id: nil)
  }

  describe "GET #index" do
    context "when user is not logged in" do
      it "redirects to login page" do
        get :index

        expect(response).to have_http_status(302)
      end
    end

    context "when user is logged in" do
      it "returns a successful response" do
        sign_in user
        get :index

        expect(response).to be_successful
      end
    end
  end

  describe "GET #show" do
    let(:entry) { create(:entry, valid_attributes) }

    it "returns a success response" do
      get :show, params: { id: entry.to_param }

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    context "when user is not logged in" do
      it "redirects to login page" do
        get :new

        expect(response).to have_http_status(302)
      end
    end

    context "when user is logged in" do
      it "returns a successful response" do
        sign_in user
        get :new

        expect(response).to be_successful
      end
    end
  end

  describe "GET #edit" do
    let(:entry) { create(:entry, valid_attributes) }

    it "returns a success response" do
      get :edit, params: { id: entry.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before { sign_in user }

      it "creates a new Entry" do
        expect {
          post :create, params: { entry: valid_attributes }
        }.to change(Entry, :count).by(1)
      end

      it "redirects to the created entry" do
        post :create, params: { entry: valid_attributes }
        expect(response).to redirect_to(Entry.last)
      end

      it "render success flash message" do
        post :create, params: { entry: valid_attributes }
        expect(flash[:success]).to_not be_nil
      end

      it "render success flash message text" do
        post :create, params: { entry: valid_attributes }
        expect(flash[:success]).to match(/Entry was successfully created./)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:entry, feeling: :sad, user_id: user.id)
      }
      let(:entry) { create(:entry, user_id: user.id) }

      it "updates the requested entry" do
        put :update, params: { id: entry.to_param, entry: new_attributes }
        entry.reload
        expect(entry.feeling).to eq("sad")
      end

      it "redirects to the entry" do
        put :update, params: { id: entry.to_param, entry: valid_attributes }
        expect(response).to redirect_to(entry)
      end

      it "render success flash message" do
        put :update, params: { id: entry.to_param, entry: valid_attributes }
        expect(flash[:success]).to_not be_nil
      end

      it "render success flash message text" do
        put :update, params: { id: entry.to_param, entry: valid_attributes }
        expect(flash[:success]).to match(/Entry was successfully updated./)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested entry" do
      entry = Entry.create! valid_attributes
      expect {
        delete :destroy, params: {id: entry.to_param}
      }.to change(Entry, :count).by(-1)
    end

    it "redirects to the entries list" do
      entry = Entry.create! valid_attributes
      delete :destroy, params: {id: entry.to_param}
      expect(response).to redirect_to(entries_url)
    end

    it "render success flash message" do
      entry = Entry.create! valid_attributes
      post :destroy, params: {id: entry.to_param}
      expect(flash[:success]).to_not be_nil
    end

    it "render success flash message text" do
      entry = Entry.create! valid_attributes
      post :destroy, params: {id: entry.to_param}
      expect(flash[:success]).to match(/Entry was successfully destroyed./)
    end
  end
end
