class TramitesController < ApplicationController
  def index
  	@tramites = Tramites.order(id_tramite: :desc).limit(10)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
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
    	redirect_to errors_path , t.errors.full_messages.to_sentence
    end    
  end

end
