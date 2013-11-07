class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  skip_before_filter :require_no_authentication
  protect_from_forgery

  before_filter :ensure_access

  private

  @@allowed_roles = []

  def self.allow_user(role_name)
    @@allowed_roles << role_name
  end

  def ensure_access
    if @@allowed_roles.present?
      raise "Acesso não permitido" unless @@allowed_roles.include?(current_user.role.to_sym)
    end
  end
end
