class Consulta < ActiveRecord::Base
	belongs_to :persona

	def getEstadoClass
		if self.estado == 'P'
			return 'label-success'
		end
		if self.estado == 'C'
			return  'label-danger'
		end
	end
end
