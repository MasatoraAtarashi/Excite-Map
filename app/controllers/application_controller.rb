class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery with: :null_session
  protect_from_forgery with: :null_session, if: ->{request.format.json?}

  def logged_in_user
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def admin_user
    unless current_user.admin
      redirect_to new_user_session_path
    end
  end
  
  def after_sign_up_path_for(resource)
    admin_path
  end

  def after_sign_in_path_for(resource)
    admin_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    root_path
  end
end
