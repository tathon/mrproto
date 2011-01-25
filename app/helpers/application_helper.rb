module ApplicationHelper
	def logo
		image_tag("logo.png", :alt => "Management Portal", :class => "round")
	end	

	def title
		base_title = "Management Portal"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end	
end
