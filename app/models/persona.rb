class Persona < ActiveRecord::Base
	has_many :consultas
	has_many :imponibles, :foreign_key => "titular_id", :class_name => "Imponible"
	has_many :telefonos, :foreign_key => "persona_id", :class_name => "PersonaTelefono"
	has_many :mails, :foreign_key => "persona_id", :class_name => "PersonaMail"
end
