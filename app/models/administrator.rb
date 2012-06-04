class Administrator < ActiveRecord::Base
	attr_accessor 	:password 
	attr_accessible :name, :password, :password_confirmation

	

  	validates :name,  		presence: { message: "Er moet een naam ingevuld worden"}, 
  							length: { maximum: 50, message: "Je naam mag niet langer dan 50 karkaters zijn"}

  	validates :password, 	presence: { message: "Er moet een wachtwoord ingevuld worden"}, 
							confirmation: { message: "Er is niet tweemaal het zelfde wachtwoord ingevuld"}, 
							length: { within: 6..40, message: "Het wachtwoord moet tussen de 6 en 40 kakaters lang zijn"}


	before_save :encrypt_password

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

	class << self 
	def authenticate(name, submitted_password)
		administrator =  find_by_name(name)
		return nil if administrator.nil?
		return administrator if administrator.has_password?(submitted_password)
		end

		def authenticate_with_salt(id, cookie_salt)
			administrator = find_by_id(id)
			(administrator && administrator.salt == cookie_salt) ? administrator : nil
		end
	end

	private 

		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end
		
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end