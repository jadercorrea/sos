class UsersController < ApplicationController
  before_filter :load_resources, only: [:new, :edit, :update, :create]
  def index
    @users = User.all.order(:name)
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end


  private

  def load_resources
    @roles = Role.all.map { |m| [m.name, m.id] }
    @clients = Client.all.map { |m| [m.name, m.id] }
  end
end
