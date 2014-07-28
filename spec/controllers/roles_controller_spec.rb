require 'spec_helper'

describe RolesController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
    @role = create(:role)
  end

  describe "#GET" do
    context "role index" do
      before do
        get :index
      end

      it "populates a list of roles" do
        expect(assigns(:roles)).to eq(Role.all.to_a)
      end

      it "should succeed" do
        expect(response).to be_success
      end

      it "shows the role index page" do
        expect(response).to render_template(:index)
      end
    end

    context "show role" do
      before do
        get :show, id: @role.id
      end

      it "shows the role page" do
        expect(response).to be_success
        expect(response).to render_template(:show)
        expect(assigns[:role]).to eql(@role)
      end
    end
  end

  describe "#POST" do
    context "with valid attributes" do
      it "renders a new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "creates an role" do
        expect {
          post :create, :role => { name: 'success' }
        }.to change { Role.count }.by(1)

        expect(response).to redirect_to Role.last
      end

      context "with invalid attributes" do
        it "renders the new template on failure" do
          Role.any_instance.should_receive(:save).and_return(false)

          expect {
            post :create, :role => { name: nil }
          }.to_not change { Role.count }

          expect(response).not_to be_redirect
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "#PUT" do
    context "with valid attributes" do
      before do
        put :update, id: @role, role: FactoryGirl.attributes_for(:role, name: "update")
      end

      it "changes role attributes" do
        @role.reload
        expect(@role.name).to eql("update")
      end

      it "redirects to the updated role" do
        expect(response).to redirect_to @role
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: @role, role: FactoryGirl.attributes_for(:role, name: nil)
      end

      it "does not change role attributes" do
        @role.reload
        expect(@role.name).not_to eql(nil)
        expect(response).not_to be_redirect
      end

      it "renders the edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#DELETE" do
    it "deletes the role" do
      expect{
        delete :destroy, id: @role
      }.to change {Role.count}.by(-1)
    end

    it "redirects to role #index" do
      delete :destroy, id: @role
      expect(response).to redirect_to roles_url
    end
  end
end
