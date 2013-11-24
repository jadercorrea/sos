class ReportsController < ApplicationController
  allow_user :admin

  def show
    @users = User.all
    @clients = Client.page(params['page']).per(7)
  end
end
