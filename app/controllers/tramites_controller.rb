class TramitesController < ApplicationController
  def index
  	@tramites = Tramites.order(id_tramite: :desc).limit(10)
    @tabla = Table.new(Tramites.column_names, @tramites)
  end

  def show
    @tramite = Tramites.find(params[:id])
  end

  def new
    @tramite = Tramites.new
  end

  def edit
    @tramite = Tramites.find(params[:id])
  end

  def create
    begin
      t = Tramites.new
      t.id_tramite = Tramites.maximum(:id_tramite) + 1
      t.uf = params[:tramites][:uf]
      t.id_motivo_tr = params[:tramites][:id_motivo_tr]
      t.razon_soc = params[:tramites][:razon_soc]
      t.ingreso_fh = DateTime.now
      t.ingreso_login = 'alespi'
      t.id_sc = 111
      t.id_canal = 'P'
      t.soluciona_incidente = false
      t.estado = 'P'
      t.interno = false
      t.id_sr_actual = 1
      t.id_msr_actual = 1
      t.id_nodo_actual = 1
      t.descripcion = 'creado por ruby on rails!'
      if t.save
      	redirect_to tramites_path
      else
        redirect_to error_path, errors: ('else = '+t.errors.full_messages.to_sentence)
      end 
    rescue Exception => e
      redirect_to error_path errors:('raise = '+e.message)
      #redirect_to controller: 'static_contents', action: 'errors', errors: e.message + ' <br> ' + e.backtrace.inspect
    end   
  end

end
