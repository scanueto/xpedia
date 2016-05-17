class SesionesController < ApplicationController
  layout 'login'

  def new
  end

  def create
  	user = nil
  	begin
      if params[:email].to_s.include? "@"
        user = Usuario.find_by_email(params[:email])
      else
        user = Usuario.find_by_login(params[:email])
      end

      unless user && user.authenticate(params[:password])
        user = nil
        message = "Email o password incorrectos."
        render new_sesiones_path
      end

      #si se logro cargar/crear usuario, loguearlo y redirigirlo
      if user
        login(user)
        redirect_path = root_url
      end
      
      redirect_to redirect_path, notice: message

    rescue Exception => e  
      raise e.message 
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url , notice: "Logged out!"
  end


  private
  def login(usuario)
    if usuario.auth_token.blank?
      usuario.generate_token(:auth_token)
      usuario.save
    end

    usuario.last_action = Time.zone.now
    usuario.save

    if params[:remember_me]
      cookies.permanent[:auth_token] = usuario.auth_token
    else
      cookies[:auth_token] = usuario.auth_token
    end
  end
end
