class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    sign_up_complete_users_path
  end
end
