require 'spec_helper'

describe MicropostsController do
  render_views

  describe "access controll" do
    it "should deny access to 'create'" do
      post :create
      response.should redirec_to(signin_path)
    end
  end

  
    it "should be successful" do
      delete :destroy, :id => 1
      response.should redirec_to(signin_path)
    
  end

end
