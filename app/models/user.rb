# == Schema Information
# Schema version: 20110125063354
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  userid     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :name, :userid, :password, :password_confirmation
	
	validates :name, 	:presence => true,
										:length => { :maximum => 50 }
	validates :userid, 	:presence => true,
											:uniqueness => { :case_sensitive => false }
	validates :password, 	:presence => true,
												:confirmation => true,
												:length => { :within => 6..40 }
												
	before_save :encrypt_password
	
	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(userid, submitted_password)
		user = find_by_userid(userid)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
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
