class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:session][:email],
	                           params[:session][:password])
	  if user.nil?
	    # Create an error message and re-render the signin form.
	    flash.now[:error] = "Sorry, the user name or password mismatch!"
	    @title = "Sign In"
	    render 'new'
	  else
	    # Sign the user in and redirect to the user's show page.
	    sign_in user
	    redirect_back_or user
	  end
  end

  def destroy
  	user = params[:session]
  	sign_out user
  	redirect_to root_path
  end

end
