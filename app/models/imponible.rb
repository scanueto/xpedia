class Imponible < ActiveRecord::Base
	belongs_to :titular, :foreign_key  => "titular_id", :primary_key => "id", :class_name => "Persona"
	belongs_to :responsable_pago, :primary_key  => "id", :foreign_key => "responsable_pago_id", :class_name => "Persona"
end
