# == Schema Information
# Schema version: 20110126064341
#
# Table name: ps451as
#
#  id         :integer(4)      not null, primary key
#  regioncode :string(255)
#  loccode    :string(255)
#  locdesc    :string(255)
#  invcnt     :integer(4)
#  qty        :integer(4)
#  orgamt     :integer(4)
#  netamt     :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Ps451a < ActiveRecord::Base
end
