require 'spec_helper'

describe User do
	before(:each) do
		@attr = { :name => "Example User", :userid => "exampleuser" }
	end
	
	it "should create a new instance given valid attributes" do
		User.create!(@attr)
	end
	
	it "should require a name" do
		no_name_user = User.new(@attr.merge(:name => ""))
		no_name_user.should_not be_valid
	end
	
	it "should reject names that are too long" do
		long_name = "a" *51
		long_name_user = User.new(@attr.merge(:name => long_name))
		long_name_user.should_not be_valid
	end
	
	it "should reject duplicate user id" do
		User.create!(@attr)
		user_with_duplicate_userid = User.new(@attr)
		user_with_duplicate_userid.should_not be_valid
	end
	
	it "should reject userid identical up to case" do
		upcased_userid = @attr[:userid].upcase
		User.create!(@attr.merge(:userid => upcased_userid))
		user_with_duplicated_userid = User.new(@attr)
		user_with_duplicated_userid.should_not be_valid
	end
end
