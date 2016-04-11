class TramitesController < ApplicationController
  def index
  	@tramites = Tramites.order(id_tramite: :desc).limit(10)
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
      t.id_tramite = Tramites.count + 1
      t.uf = params[:tramite][:uf]
      t.id_motivo_tr = params[:tramite][:id_motivo_tr]
      t.razon_soc = params[:tramite][:razon_soc]
      t.ingreso_fh = DateTime.now
      t.ingreso_login = 'ruby'
      t.id_sc = 111
      t.id_canal = 'P'
      t.soluciona_incidente = false
      if t.save
      	redirect_to tramites_path
      else
        redirect_to error_path, t.errors.full_messages.to_sentence
      end 
    rescue Exception => e
      redirect_to error_path errors:e.message
      #redirect_to controller: 'static_contents', action: 'errors', errors: e.message + ' <br> ' + e.backtrace.inspect
    end   
  end

end
