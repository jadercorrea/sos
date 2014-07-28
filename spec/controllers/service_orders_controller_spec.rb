require 'spec_helper'

describe ServiceOrdersController do
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client) }

  before do
    sign_in user
    @service_order = create(:service_order)
  end

  describe "#GET" do
    context "service_order index" do
      before do
        get :index
      end

      it "populates a list of service_orders" do
        expect(assigns(:service_orders)).to eq(ServiceOrder.all.to_a)
      end

      it "should succeed" do
        expect(response).to be_success
      end

      it "shows the service_order index page" do
        expect(response).to render_template(:index)
      end
    end

    context "show service_order" do
      before do
        get :show, id: @service_order.id
      end

      it "shows the service_order page" do
        expect(response).to be_success
        expect(response).to render_template(:show)
        expect(assigns[:service_order]).to eql(@service_order)
      end
    end
  end

  describe "#POST" do
    context "with valid attributes" do
      it "renders a new page" do
        get :new
        expect(response).to render_template(:new)
      end

      it "creates an service_order" do
        expect {
          post :create, service_order: FactoryGirl.attributes_for(:service_order, project: "post", user_id: user.id, client_id: client.id) 
        }.to change { ServiceOrder.count }.by(1)

        expect(response).to redirect_to ServiceOrder.last
      end

      context "with invalid attributes" do
        it "renders the new template on failure" do
          ServiceOrder.any_instance.should_receive(:save).and_return(false)

          expect {
            post :create, service_order: { project: nil }
          }.to_not change { ServiceOrder.count }

          expect(response).not_to be_redirect
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "#PUT" do
    context "with valid attributes" do
      before do
        put :update, id: @service_order, service_order: FactoryGirl.attributes_for(:service_order, project: "update")
      end

      it "changes service_order attributes" do
        @service_order.reload
        expect(@service_order.project).to eql("update")
      end

      it "redirects to the updated service_order" do
        expect(response).to redirect_to @service_order
      end
    end

    context "with invalid attributes" do
      before do
        put :update, id: @service_order, service_order: FactoryGirl.attributes_for(:service_order, project: nil)
      end

      it "does not change service_order attributes" do
        @service_order.reload
        expect(@service_order.project).not_to eql(nil)
        expect(response).not_to be_redirect
      end

      it "renders the edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#DELETE" do
    it "deletes the service_order" do
      expect{
        delete :destroy, id: @service_order
      }.to change {ServiceOrder.count}.by(-1)
    end

    it "redirects to service_order #index" do
      delete :destroy, id: @service_order
      expect(response).to redirect_to service_orders_url
    end
  end
end
