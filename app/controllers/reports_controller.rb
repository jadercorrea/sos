class ReportsController < ApplicationController
  allow_user :admin

  def show
    @users = User.all
  end
end
