require 'spec_helper' 
describe ApplicationController do
  let(:client) { FactoryGirl.create(:client, name: "client") }
  let(:user) { FactoryGirl.create(:user) }
  let(:app_controller) { double }
  let(:entity_to_create) { 'client' }
  let(:entity_to_update) { 'user' }

  before do
    sign_in user
    client
  end

  context "load_resources" do
    it ".load_clients" do
      clients = Client.all.map { |m| [m.name, m.id] }
      app_controller.stub(:load_clients).and_return(clients)
      expect(app_controller.load_clients).to eq([[client.name, client.id]])
    end

    it ".load_users" do
      users = User.all.map { |m| [m.name, m.id] }
      app_controller.stub(:load_users).and_return(users)
      expect(app_controller.load_users).to eq([[user.name, user.id]])
    end

    it ".create_entity" do
      app_controller.stub(:create_entity).with(entity_to_create).and_return(client)
      expect(app_controller.create_entity('client')).to eq(client)
    end

    it ".update entity" do
      app_controller.stub(:update_entity).with(entity_to_update).and_return(user)
      expect(app_controller.update_entity('user')).to eq(user)
    end
  end
end
