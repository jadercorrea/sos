require 'spec_helper'

describe SessionsController do
  it "sets the login layout" do
    expect(described_class._layout).to eq("login")
  end
end
