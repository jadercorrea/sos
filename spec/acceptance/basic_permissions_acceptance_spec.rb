# encoding: utf-8
require "spec_helper"

feature "Basic permissions" do
  let(:admin_role)       { FactoryGirl.create(:role) }
  let(:colaborator_role) { FactoryGirl.create(:role, :colaborator) }
  let(:admin)            { FactoryGirl.create(:user, role: admin_role) }
  let(:colaborator)      { FactoryGirl.create(:user, role: colaborator_role) }

  scenario "Allowed roles are not persisted across requests" do
    login_into_admin(admin)
    click_link "Relatórios"
    click_link "Logout"

    login_into_admin(colaborator)
    page.should have_content "Logout"
    page.should_not have_content "Relatórios"
  end
end
