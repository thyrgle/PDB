class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.player.nil?
       new_player_path
    else
       root_path
    end
  end

  include ApplicationHelper
end
