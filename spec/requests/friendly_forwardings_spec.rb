require 'spec_helper'

describe "FriendlyForwardings" do
  
    it "should forward to the requested page after signed in" do
    	user = Factory(:user)
    	visit edit_user_path(user)

    	fill_in :email, :with => user.email
    	fill_in :password, :with => user.password
    	click_button

    	respons.should	 render_template('users/edit')
    end
  
end
