class ConsultasController < ApplicationController
  include SesionesHelper

  before_filter :signed_in_user

  respond_to :html, :json
  def index
    @consultas = Consulta.order(id: :desc).limit(10)

    respond_to do |format|
      format.html
      format.json {
        if(params.has_key?(:q))
          @personas = Persona.where("LOWER(razon) LIKE ?", "%#{params[:q].downcase}%").order(id: :desc)
          respond_with @personas
        else 
          render nothing: true
        end
      }
    end

  end

  def new
    @consulta = Consulta.new
    @canales = Canal.all
    @personas = Persona.order(id: :desc).limit(10)
  end

  def edit
  end

  def show
  end

  def create
    begin
      c = Consulta.new
      c.pregunta = params[:consulta][:pregunta]
      c.respuesta = params[:consulta][:respuesta]
      c.id_canal_preg = params[:consulta][:id_canal_preg]
      c.estado = 'P'
      c.login_alta = 'desarrollo'
      c.persona_id = params[:persona]

      if c.save
        redirect_to consultas_path
      else
        redirect_to error_path, errors: ('else = '+t.errors.full_messages.to_sentence)
      end 
    rescue Exception => e
      redirect_to error_path errors:('raise = '+e.message)
    end 
  end

  def update
  end

  def destroy
  end
end
