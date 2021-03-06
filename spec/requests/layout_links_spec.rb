require 'spec_helper'

describe "LayoutLinks" do
	it "should have a Home page at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end
	
	it "should have the right links on the layout" do
		visit root_path
		click_link "Home"
		response.should have_selector('title', :content => "Home")
	end
	
	describe "when not signed in" do
		it "should have a signin link" do
			visit root_path
			response.should have_selector("a", 	:href => signin_path,
																					:content => "Sign in")
		end
	end
	
	describe "when signin in" do
		before(:each) do
			@user = Factory(:user)
			visit signin_path
			fill_in :userid,		:with => @user.userid
			fill_in :password,	:with => @user.password
			click_button
		end
		
		it "should have a signout link" do
			visit root_path
			response.should have_selector("a",	:href => signout_path,
																					:content => "Sign out")
		end		
	end
end
