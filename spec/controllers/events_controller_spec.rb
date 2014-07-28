require 'spec_helper'

describe EventsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client) }
  let(:ticket) { FactoryGirl.create(:ticket) }

  before do
    sign_in user
    @event = create(:event)
  end

  describe "#GET" do
    context "event index" do
      before do
        get :index
      end

      it "populates a list of events" do
        expect(assigns(:events)).to eql([@event])
      end

      it "should succeed" do
        expect(response).to be_success
      end

      it "shows the event index page" do
        expect(response).to render_template(:index)
      end
    end

    context "show event" do
      before do
        get :show, id: @event.id
      end

      it "shows the event page" do
        expect(response).to be_success
        expect(response).to render_template(:show)
        expect(assigns[:event]).to eql(@event)
      end
    end
  end

  describe "#POST" do
    context "with valid attributes" do
      it "renders a new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "creates an event" do
        expect {
          post :create, :event => { title: 'success', description: 'desc', start_datetime: Time.now, client_id: client.id, ticket_id: ticket.id }
        }.to change { Event.count }.by(1)

        expect(response).to redirect_to events_url
      end

      context "with invalid attributes" do
        it "renders the new template on failure" do
          Event.any_instance.should_receive(:save).and_return(false)

          expect {
            post :create, :event => { title: 'fail' }
          }.to_not change { Event.count }

          expect(response).not_to be_redirect
          expect(response).to render_template(:new)
          expect(assigns[:event]).to be_instance_of(Event)
        end
      end
    end
  end

  describe "#PUT" do
    context "with valid attributes" do
      before do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, title: "update")
      end

      it "locates the requested event" do
        expect(assigns(:event)).to eql(@event)
      end

      it "changes event attributes" do
        @event.reload
        expect(@event.title).to eql("update")
      end

      it "redirects to the updated event" do
        expect(response).to redirect_to @event
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: @event, event: FactoryGirl.attributes_for(:event, title: nil)
      end

      it "does not change event attributes" do
        @event.reload
        expect(@event.title).not_to eql(nil)
        expect(response).not_to be_redirect
      end

      it "renders the edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#DELETE" do
    it "deletes the event" do
      expect{
        delete :destroy, id: @event
      }.to change {Event.count}.by(-1)
    end

    it "redirects to event #index" do
      delete :destroy, id: @event
      expect(response).to redirect_to events_url
    end
  end
end
