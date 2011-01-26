require 'spec_helper'

describe ReportsController do
	render_views

	describe "GET 'ps451'" do
		describe "for non-signed-in users" do
			it "should deny access" do
				get :ps451
				response.should redirect_to(signin_path)
				flash[:notice].should =~ /sign in/i
			end
		end
		
		describe "for signed-in users" do
			before(:each) do
				@user = test_sign_in(Factory(:user))
				first = Factory(:ps451a)
				
				@ps451as = [first]
				40.times do
					@ps451as << Factory(:ps451a, { :loccode => Factory.next(:loccode),
					                               :locdesc => Factory.next(:locdesc) })
				end
			end
			
			it "should be successful" do
				get :ps451
				response.should be_success
			end
			
			it "should have an element for each ps451a record" do
				get :ps451
				@ps451as[0..2].each do |ps451a|
					response.should have_selector("li", :content => ps451a.loccode)
				end
			end
			      
			it "should paginagte ps451a" do
				get :ps451
				response.should have_selector("div.pagination")
				response.should have_selector("span.disabled", :content => "Previous")
				response.should have_selector("a", 	:href => "/ps451?page=2",
																						:content => "2")
				response.should have_selector("a",	:href => "/ps451?page=2",
																						:content => "Next")
			end
		end
	end
end
