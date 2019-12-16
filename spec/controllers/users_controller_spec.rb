require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:user)
  }

  let(:invalid_attributes) {
    { password: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    before { create(:user, valid_attributes) }

    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:user) { create(:user, valid_attributes) }

    it "returns a success response" do
      get :show, params: { id: user.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    let(:user) { create(:user, valid_attributes) }

    it "returns a success response" do
      get :edit, params: { id: user.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes }, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(User.last)
      end

      it "render success flash message" do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(flash[:success]).to_not be_nil
      end

      it "render success flash message text" do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(flash[:success]).to match(/User was successfully created./)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { user: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end

      it "render failure flash message" do
        expect_any_instance_of(User).to receive(:save).and_return(false)
        post :create, params: { user: invalid_attributes }, session: valid_session
        expect(flash[:error]).to_not be_nil
      end

      it "render failure flash message text" do
        expect_any_instance_of(User).to receive(:save).and_return(false)
        post :create, params: { user: invalid_attributes }, session: valid_session
        expect(flash[:error]).to match(/Sorry, an error has occured/)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:user, name: 'New Name')
      }
      let(:user) { create(:user, valid_attributes) }

      it "updates the requested user" do
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        expect(user.name).to eq('New Name')
      end

      it "redirects to the user" do
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(user)
      end

      it "render success flash message" do
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(flash[:success]).to_not be_nil
      end

      it "render success flash message text" do
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(flash[:success]).to match(/User was successfully updated./)
      end
    end

    context "with invalid params" do
      let(:user) { create(:user, valid_attributes) }

      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end

      it "render failure flash message" do
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(flash[:error]).to_not be_nil
      end

      it "render failure flash message text" do
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(flash[:error]).to match(/Sorry, an error has occured/)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, params: {id: user.to_param}, session: valid_session
      expect(response).to redirect_to(users_url)
    end

    it "render success flash message" do
      user = User.create! valid_attributes
      post :destroy, params: {id: user.to_param}, session: valid_session
      expect(flash[:success]).to_not be_nil
    end

    it "render success flash message text" do
      user = User.create! valid_attributes
      post :destroy, params: {id: user.to_param}, session: valid_session
      expect(flash[:success]).to match(/User was successfully destroyed./)
    end
  end
end
