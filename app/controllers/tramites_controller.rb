class TramitesController < ApplicationController
  def index
  	@tramites = Tramite.order(id: :desc).limit(10)
    @tabla = Table.new(["id", "motivo_id", "sector_id", "estado", "observacion"], @tramites)
  end

  def show
    @tramite = Tramite.find(params[:id])
  end

  def new
    @tramite = Tramite.new
    @motivos = Motivo.all
    @canales = Canal.all
    @imponibles = Imponible.order(id: :desc).limit(5)
    @sectores  = Sector.all
  end

  def edit
    @tramite = Tramite.find(params[:id])
  end

  def create
    begin
      puts params.to_yaml
      i =  Imponible.find params[:imponible]
      t = Tramite.crear(params[:tramite][:motivo_id], params[:tramite][:sector_id], params[:tramite][:canal_id],
                        current_user.login, i.id, 'creado!', 1, i.titular_id, nil)
      if t
      	redirect_to tramites_path
      else
        redirect_to error_path, errors: ('else = '+t.errors.full_messages.to_sentence)
      end
    rescue Exception => e
      redirect_to error_path errors:('raise = '+e.message)
    end   
  end

end
