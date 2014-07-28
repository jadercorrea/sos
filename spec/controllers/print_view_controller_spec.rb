require 'spec_helper'

describe PrintViewController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
    @service_order = create(:service_order)
  end

  describe "#GET show" do
    before do
      get :show, id: @service_order.id
    end

    it "shows the print view page" do
      expect(response).to be_success
      expect(response).to render_template(:show)
      expect(assigns[:service_order]).to eql(@service_order)
    end
  end
end
