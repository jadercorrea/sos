class ReportsController < ApplicationController
  allow_user :admin

  def show
    @users = User.colaborators.to_a
    @clients = Client.page(params['page']).per(7)
  end
end
