class MainpageController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def show
  	if user_signed_in?
  		puts "SUCCESS"
  		#sign_out current_user
  		redirect_to "/explore"
	  else
  	  redirect_to "/intro"
  	end
  end
end
