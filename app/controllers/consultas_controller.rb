class ConsultasController < ApplicationController
  def index
    @consultas = Consulta.order(id: :desc).limit(10)
    @tabla = Table.new(["id", "pregunta", "respuesta", "login_alta", "estado"], @consultas)
  end

  def new
    @consulta = Consulta.new
    @canales = Canal.all
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
      c.persona_id = 2

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
