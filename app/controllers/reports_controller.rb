class ReportsController < ApplicationController
  allow_user :admin

  def show
    @users = User.all
    @clients = Client.page(params['page']).per(10)
  end
end
