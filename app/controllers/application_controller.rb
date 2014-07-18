class ApplicationController < ActionController::Base
  before_filter :clean_user_permission
  before_filter :authenticate_user!
  skip_before_filter :require_no_authentication
  protect_from_forgery

  before_filter :ensure_access

  def load_resources
    @clients = load_clients
    @users = load_users
  end

  private

  def self.allow_user(role_name)
    self.before_filter { |c| c.send(:allow_user, role_name) }
  end

  def allow_user(role_name)
    @allowed_roles << role_name
  end

  def clean_user_permission
    @allowed_roles = []
  end

  def ensure_access
    if @allowed_roles.present? && current_user.present?
      raise "Acesso não permitido" unless @allowed_roles.include?(current_user.role.to_sym)
    end
  end

  def load_clients
    Client.all.map { |m| [m.name, m.id] }
  end

  def load_users
    User.colaborators.to_a.map { |n| [n.name, n.id] }
  end
end
