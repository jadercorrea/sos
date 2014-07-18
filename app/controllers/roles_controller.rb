class RolesController < ApplicationController

  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def edit
    @role = Role.find(params[:id])
  end

  def create
    create_entity("role")
  end

  def update
    update_entity("role")
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    redirect_to roles_url
  end
end
