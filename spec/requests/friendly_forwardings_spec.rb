require 'spec_helper'

describe "FriendlyForwardings" do
	it "should forward to the requested page after signin" do
		user = Factory(:user)
		visit ps451_path(user)
		fill_in :userid,		:with => user.userid
		fill_in :password,	:with => user.password
		click_button
		response.should have_selector("title", :content => "PS451")
	end
end
