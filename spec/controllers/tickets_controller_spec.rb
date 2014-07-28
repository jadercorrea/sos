require 'spec_helper'

describe TicketsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client) }

  before do
    sign_in user
    @ticket = create(:ticket)
    @ticket_message = create(:ticket_message, ticket_id: @ticket.id, user_id: @ticket.user_id)
  end

  describe "#GET" do
    context "ticket index" do
      before do
        get :index
      end

      it "populates a list of tickets" do
        expect(assigns(:tickets)).to eq(Ticket.all.to_a)
      end

      it "should succeed" do
        expect(response).to be_success
      end

      it "shows the ticket index page" do
        expect(response).to render_template(:index)
      end
    end

    context "show ticket" do
      before do
        get :show, id: @ticket.id
      end

      it "shows the ticket page" do
        expect(response).to be_success
        expect(response).to render_template(:show)
        expect(assigns[:ticket]).to eql(@ticket)
      end
    end
  end

  describe "#POST" do
    context "with valid attributes" do
      it "renders a new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "creates an ticket" do
        expect {
          post :create, ticket: FactoryGirl.attributes_for(:ticket, title: "post", user_id: user.id, client_id: client.id)
        }.to change { Ticket.count }.by(1)

        expect(response).to redirect_to tickets_url
      end
    end

    context "with invalid attributes" do
      it "renders the new template on failure" do
        Ticket.any_instance.should_receive(:save).and_return(false)

        expect {
          post :create, ticket: FactoryGirl.attributes_for(:ticket, title: "post", user_id: user.id, client_id: client.id)
        }.to_not change { Ticket.count }

        expect(response).not_to be_redirect
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#PUT" do
    context "with valid attributes" do
      before do
        put :update, id: @ticket, ticket: FactoryGirl.attributes_for(:ticket, title: "update", user_id: user.id, client_id: client.id )
      end

      it "redirects to the tickets edit page" do
        expect(response).to be_redirect
        expect(response).to redirect_to edit_ticket_path(@ticket)
      end

      it "changes ticket attributes" do
        @ticket.reload
        expect(@ticket.title).to eql("update")
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: @ticket, ticket: FactoryGirl.attributes_for(:ticket, title: nil)
      end

      it "does not change ticket attributes" do
        @ticket.reload
        expect(@ticket.title).not_to eql(nil)
      end

      it "renders the edit page" do
        expect(response).not_to be_redirect
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#DELETE" do
    it "deletes the ticket" do
      expect{
        delete :destroy, id: @ticket
      }.to change {Ticket.count}.by(-1)
    end

    it "redirects to ticket #index" do
      delete :destroy, id: @ticket
      expect(response).to redirect_to tickets_url
    end
  end
end
