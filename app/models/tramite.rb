class Tramite < ActiveRecord::Base
	belongs_to :motivo
	belongs_to :canal
	belongs_to :sector
	has_many :evoluciones
	belongs_to :persona

	def self.crear(motivo, sector, canal, login, imponible, observacion, nodo, persona, codigo)
		t = Tramite.new
		t.motivo_id = motivo
		t.sector_id = sector
		t.canal_id  = canal
		t.login_alta = login
		t.imponible_id = imponible
		t.observacion  = observacion
		t.nodo_id = nodo
		t.persona_id = persona
		t.codigo_externo = codigo
		t.estado = 'P'

		transaction do
			t.do_primera_evolucion(login)
			t.save
		end
		t
    end

    def do_primera_evolucion(login)
    	self.fh_ult_evo = DateTime.now
    	self.login_ult_evo = login
    	self.save

    	evo = Evolucion.new
    	evo.secuencia = 1
    	evo.tramite_id = self.id
    	evo.login = login
    	evo.sector_origen_id = self.sector_id
    	evo.sector_destino_id = self.sector_id
    	evo.nodo_origen_id = self.nodo_id
    	evo.nodo_destino_id = self.nodo_id
    	evo.save
    end

    def getEstadoClass
		if self.estado == 'P'
			return 'label-success'
		end
		if self.estado == 'C'
			return  'label-danger'
		end
	end

	def ocupado?
		return (self.ocupado_por != nil)
	end

	def ocupar(login)
		if !self.ocupado?
			self.ocupado_por = login
			self.save
		end
	end

	def desocupar
		if !self.ocupado?
			self.ocupado_por = nil
			self.save
		end
	end

end
