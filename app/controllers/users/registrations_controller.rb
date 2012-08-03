# -*- coding: utf-8 -*-
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      flash[:error] = "아이디 및 비밀번호를 확인해주세요."
      respond_with resource, :location => new_user_registration_path
    end
  end

  def after_sign_up_path_for(resource)
    sign_up_complete_users_path
  end
end
