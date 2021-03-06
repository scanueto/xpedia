class Usuario < ActiveRecord::Base
	has_secure_password

	before_create { generate_token(:auth_token) }

	def generate_token(column)
	  begin
		self[column] = SecureRandom.urlsafe_base64
	  end while Usuario.exists?(column => self[column])
	end
end
