class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end

  helper_method :current_user

  private

  def current_user
    if cookies[:auth_token].blank?
      @current_user = nil
    else
      @current_user ||= Usuario.find_by_auth_token!(cookies[:auth_token])
    end
  end


end
