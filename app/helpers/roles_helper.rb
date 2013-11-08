module RolesHelper
  def admin?
    current_user.admin?
  end

  def colaborator?
    current_user.colaborator?
  end

  def client?
    current_user.client?
  end
end

