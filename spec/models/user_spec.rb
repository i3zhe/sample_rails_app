require 'spec_helper'

describe User do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
  	@attr = {:name => "Example User", :email => "user@example.com"}
  end

  it "should create a new instance given valid attributes" do
  	User.create!(@attr)
  end

  it "should require a name" do
  	no_name_user = User.new(@attr.merge(:name => ""))
  	no_name_user.should_not be_valid
  end

  it "should reject names that are too long" do
  	long_name = "a" * 51
  	long_name_user = User.new(@attr.merge(:name => long_name))
  	long_name_user.should_not be_valid
  end

  it "should accept valid emails" do
  	addresses = %w[foo@bar.com 123@123.com]

  	addresses.each do |addr|
  		user = User.new(@attr.merge(:email => addr))
  		# puts addr
  		user.should be_valid
  	end
  end

  it "should reject duplicate email addresses" do
  	User.create!(@attr)
  	duplicate_user = User.new(@attr)
  	duplicate_user.should_not be_valid
  end
  

end
