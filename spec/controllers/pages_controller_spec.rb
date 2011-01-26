require 'spec_helper'

describe PagesController do
	render_views
	
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right 'title'" do
    	get 'home'
    	response.should have_selector("title", :content => "Management Portal | Home")
    end
  end
  
  describe "authentication of Management Reports pages" do
  	before(:each) do
  		@user = Factory(:user)
  	end
  	
  	describe "for non-signed-in users" do
  		it "should not have link to 'PS451'" do
  			get :home
				response.should_not have_selector("a",
																					:href => "#",
																					:content => "PS451")  		
  		end
  	end
  	
  	describe "for signed-in users" do
			it "should have link to 'PS451'" do
				test_sign_in(@user)
				get :home
				response.should have_selector("a",
																			:href => "#",
																			:content => "PS451")  		
			end
  	end
  end

end
