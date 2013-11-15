class ApplicationController < ActionController::Base
  before_filter :clean_user_permission
  before_filter :authenticate_user!
  skip_before_filter :require_no_authentication
  protect_from_forgery

  before_filter :ensure_access

  private

  def self.allow_user(role_name)
    self.before_filter { |c| c.allow_user(role_name) }
  end

  def allow_user(role_name)
    @allowed_roles << role_name
  end

  def clean_user_permission
    @allowed_roles = []
  end

  def ensure_access
    Rails.logger.info @@allowed_roles.inspect
    if @@allowed_roles.present? && current_user.present?
      raise "Acesso não permitido" unless @@allowed_roles.include?(current_user.role.to_sym)
    end
  end
end
