require 'spec_helper'

describe User do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
  	@attr = {:name => "Example User", :email => "user@example.com",
  			 :password => "foobar",
  			 :password_confirm => "foobar"
  			}
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

  it "should require a password" do
  	User.new(@attr.merge(:password => "", :password_confirm => "")).should_not be_valid
  end

  it "should require a matching password confirmation" do
  	User.new(@attr.merge(:password_confirm => "123123")).should_not be_valid
  end

  it "should reject short passwords" do
  	short = "a" * 5
  	User.new(@attr.merge(:password => short, :password_confirm => short)).should_not be_valid
  end

  describe "password validation" do
  	before (:each) do
  		@user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
    	@user.should respond_to(:encrypted_password)
    end

  end

  describe "password encryption" do
  	before(:each) do
  		@user = User.create!(@attr)
  	end

  	describe "has_password method" do
  		it "should be true if passwords match" do
  			@user.has_password?(@attr[:password]).should be_true
  		end

  		it "should be false if passwords don't match" do
  			@user.has_password?( "foobar").should be_false
  		end

  	end

  	
  		 
  end


  describe "user microposts assosiation" do

    before(:each) do
      @user = User.create!(@attr)
      @mp1 = Factory(:micropost, :user => @user, :created_at => 1.day.ago)
      @mp2 = Factory(:micropost, :user => @user, :created_at => 1.hour.ago)
    end

    it "should have a micropost attribute" do
      @user.should respond_to(:microposts)
    end

    it "should have the right microposts in the right orders" do
      @user.microposts.should == [@mp2, @mp1]
    end

    it "should remove associated microposts when user is destroyed" do
      @user.destroy
      [@mp2, @mp1].each do |mp|
        Micropost.find(mp).should be_nil
      end
    end

  end

end
