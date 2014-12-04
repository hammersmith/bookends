class RegistrationsController < Devise::RegistrationsController

  def pending

  end

  protected

  def after_inactive_sign_up_path_for(resource)
    users_pending_registration_path
  end
end
