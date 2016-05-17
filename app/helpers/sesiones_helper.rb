module SesionesHelper
  def current_user?(user)
    user == current_user
  end

  def admin_user
    if current_user != nil
      redirect_to(root_url) unless current_user.admin?
    else
      redirect_to(root_url)
    end
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to login_path, notice: "Por favor Ingrese con Usuario y Contraseña."
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_return_to
    session[:return_to] = nil
  end

  def signed_in?
    !current_user.nil?
  end
end
