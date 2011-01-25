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
	attr_accessible :name, :userid
	
	validates :name, 	:presence => true,
										:length => { :maximum => 50 }
	validates :userid, 	:presence => true,
											:uniqueness => { :case_sensitive => false }
end
