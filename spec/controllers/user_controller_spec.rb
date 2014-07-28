require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }
  let(:role) { FactoryGirl.create(:role) }

  before do
    sign_in user
    @user = create(:user)
  end

  describe "#GET" do
    context "user index" do
      before do
        get :index
      end

      it "populates a list of users" do
        expect(assigns(:users)).to eq(User.all.to_a)
      end

      it "should succeed" do
        expect(response).to be_success
      end

      it "shows the user index page" do
        expect(response).to render_template(:index)
      end
    end

    context "show user" do
      before do
        get :show, id: @user.id
      end

      it "shows the user page" do
        expect(response).to be_success
        expect(response).to render_template(:show)
        expect(assigns[:user]).to eql(@user)
      end
    end
  end

  describe "#POST" do
    context "with valid attributes" do
      it "renders a new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "creates an user" do
        expect {
          post :create, user: { name: 'success', email: 'teste@teste.com', password: '******', role_id: role.id }
        }.to change { User.count }.by(1)

        expect(response).to redirect_to User.last
      end

      context "with invalid attributes" do
        it "renders the new template on failure" do
          User.any_instance.should_receive(:save).and_return(false)

          expect {
            post :create, user: { name: nil }
          }.to_not change { User.count }

          expect(response).not_to be_redirect
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "#PUT" do
    context "with valid attributes" do
      before do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, name: "update")
      end

      it "changes user attributes" do
        @user.reload
        expect(@user.name).to eql("update")
      end

      it "redirects to the updated user" do
        expect(response).to redirect_to users_url
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user, name: nil)
      end

      it "does not change user attributes" do
        @user.reload
        expect(@user.name).not_to eql(nil)
        expect(response).not_to be_redirect
      end

      it "renders the edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#DELETE" do
    it "deletes the user" do
      expect{
        delete :destroy, id: @user
      }.to change {User.count}.by(-1)
    end

    it "redirects to user #index" do
      delete :destroy, id: @user
      expect(response).to redirect_to users_url
    end
  end
end
