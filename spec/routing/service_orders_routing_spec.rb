require "spec_helper"

describe ServiceOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/service_orders").should route_to("service_orders#index")
    end

    it "routes to #new" do
      get("/service_orders/new").should route_to("service_orders#new")
    end

    it "routes to #show" do
      get("/service_orders/1").should route_to("service_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/service_orders/1/edit").should route_to("service_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/service_orders").should route_to("service_orders#create")
    end

    it "routes to #update" do
      put("/service_orders/1").should route_to("service_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/service_orders/1").should route_to("service_orders#destroy", :id => "1")
    end

  end
end
