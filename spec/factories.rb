Factory.define :user do |user|
	user.name										"Michael Hartl"
	user.userid									"mhartl"
	user.password								"foobar"
	user.password_confirmation	"foobar"
end

Factory.define :ps451a do |ps451a|
	ps451a.regioncode						"HKG"
	ps451a.loccode							"101"
	ps451a.locdesc							"Shop-101"
	ps451a.invcnt								100
	ps451a.qty									230
	ps451a.orgamt								280000
	ps451a.netamt								220000
end

Factory.sequence :loccode do |n|
  "#{n +101}"
end

Factory.sequence :locdesc do |n|
  "Shop-#{n +101}"
end

