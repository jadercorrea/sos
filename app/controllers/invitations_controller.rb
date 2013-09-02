class InvitationsController < Devise::InvitationsController
  skip_before_filter :authenticate_user!, only: [:destroy, :edit, :update]
  
  def update
    if this
      redirect_to root_path
    else
      super
    end
  end

end