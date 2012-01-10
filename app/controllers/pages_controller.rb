class PagesController < ApplicationController
  include SessionsHelper
  def home
    @title = "Home"
    @user = current_user
    @micropost = Micropost.new if signed_in?   
    if !@user.nil?
      @micropost = Micropost.new
      @feed_items = @user.feed.paginate(:page => params[:page])
    end
    
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end

end
