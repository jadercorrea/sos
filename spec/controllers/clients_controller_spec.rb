require 'spec_helper'

describe ClientsController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
    @client = create(:client)
  end

  describe "#GET" do
    context "client index" do
      before do
        get :index
      end

      it "populates a list of clients" do
        expect(assigns(:clients)).to eq(Client.all.to_a)
      end

      it "should succeed" do
        expect(response).to be_success
      end

      it "shows the client index page" do
        expect(response).to render_template(:index)
      end
    end

    context "show client" do
      before do
        get :show, id: @client.id
      end

      it "shows the client page" do
        expect(response).to be_success
        expect(response).to render_template(:show)
        expect(assigns[:client]).to eql(@client)
      end
    end
  end

  describe "#POST" do
    context "with valid attributes" do
      it "renders a new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "creates an client" do
        expect {
          post :create, client: { name: 'success' }
        }.to change { Client.count }.by(1)

        expect(response).to redirect_to Client.last
      end

      context "with invalid attributes" do
        it "renders the new template on failure" do
          Client.any_instance.should_receive(:save).and_return(false)

          expect {
            post :create, client: { name: nil }
          }.to_not change { Client.count }

          expect(response).not_to be_redirect
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "#PUT" do
    context "with valid attributes" do
      before do
        put :update, id: @client, client: FactoryGirl.attributes_for(:client, name: "update")
      end

      it "changes client attributes" do
        @client.reload
        expect(@client.name).to eql("update")
      end

      it "redirects to the updated client" do
        expect(response).to redirect_to @client
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: @client, client: FactoryGirl.attributes_for(:client, name: nil)
      end

      it "does not change client attributes" do
        @client.reload
        expect(@client.name).not_to eql(nil)
        expect(response).not_to be_redirect
      end

      it "renders the edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#DELETE" do
    it "deletes the client" do
      expect{
        delete :destroy, id: @client
      }.to change {Client.count}.by(-1)
    end

    it "redirects to client #index" do
      delete :destroy, id: @client
      expect(response).to redirect_to clients_url
    end
  end
end
