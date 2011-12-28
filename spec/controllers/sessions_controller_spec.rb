require 'spec_helper'
# require 'factory_girl'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

   describe "with valid email and password" do

      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end
  
      it "should sign the user in" do
        post :create, :session => @attr
        controller.current_user.should == @user
        controller.should be_signed_in
      end
  end

  describe "DELETE 'destroy'"
  	it "should sign a user out" do
  		test_sign_it(Factory(:user))
  		delete :destroy
  		controller.should_not be_signed_in
  		response.should redirect_to root_path
  	end
  end

end
