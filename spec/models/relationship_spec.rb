require 'spec_helper'

describe Relationship do
  before(:each) do
  	@follower = Factory(:user)
  	@followed = Factory(:user, :email => Factory.next(:email))

  	@relationship = @follower.relationships.build(:followed_id => @followed)
  end

  it "should create a valid instance" do
  	@relationship.save!  	
  end
end
