require 'faker'

namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		User.create!(	:name => "hon",
									:userid => "honnie",
									:password => "foobar",
									:password_confirmation => "foobar")

		100.times do |n|
			regioncode = 'HKG'
			loccode = "#{100 +n +1}"
			locdesc = "Shop-#{100 +n +1}"
			invcnt = 100
			qty = 230
			orgamt = 280000
			netamt = 220000
			Ps451a.create!(	:regioncode => regioncode,
											:loccode => loccode,
											:locdesc => locdesc,
											:invcnt => invcnt,
											:qty => qty,
											:orgamt => orgamt,
											:netamt => netamt)
		end
	end		
end

