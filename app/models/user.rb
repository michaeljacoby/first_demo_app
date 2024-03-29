require 'digest'

class User < ActiveRecord::Base
attr_accessor :password
attr_accessible :name, :email, :password, :password_confirmation, :reset_password_code, :admin


email_regex = /\A[\w.+\-]+@[a-z.]+\.[a-z]+\z/i

validates	:name,	:presence => true,
					:length => { :maximum => 50 }
validates	:email,	:presence => true,
					:format => {:with => email_regex},
					:uniqueness => {:case_sensitive => false}
					
validates	:password,	:presence => true,
						:confirmation => true,
						:length => {:within => 6..40}
					

before_save :encrypt_password



	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def has_reset_password?(submitted_password)
	
	reset_password_code == submitted_password
	
	end
	
	def has_reset_expired?
	
	Time.now <= reset_password_code_until
	
	end

	def User.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if  user.nil?
		return user if user.has_password?(submitted_password) || (user.has_reset_password?(submitted_password) && user.has_reset_expired?)
	end
	

	
	def User.admin(id)
	user = find_by_id(id)
	return false if user.nil?
	
	(user.admin == true) ? true : false
	
	end
	
	# Forgot your password
	#
	#
	#
	#
	#
	
	def resetpassword
	
	
	
	self.reset_password_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
	
	
	
	
	
	
	end
	
	
	
	
	class << self
	
		def authenticate_with_salt(id,cookie_salt)
		user = find_by_id(id)
	
		(user && user.salt == cookie_salt) ? user : nil
	
	
	end
	# added from site
	def create_reset_code(userinfo)
				
		user = find_by_id(userinfo)
		
		reset_password_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
		
		user.reset_password_code
		
		return user
	end 
  
  
  def recently_reset?
    @reset
  end 
  def delete_reset_code
    self.attributes = {:reset_code => nil}
    save(false)
  end
	
end
	
	
	
	
	
	
private


	def encrypt_password
		self.salt = make_salt if new_record?
		self.encrypted_password = encrypt(self.password)
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