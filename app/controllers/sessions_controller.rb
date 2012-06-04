class SessionsController < ApplicationController
  

 def new
  	@title = "Login"
  
 end

 def create
  	administrator = Administrator.authenticate(params[:session][:name],
  							 params[:session][:password])
	if administrator.nil?
	flash.now[:error] = "Onjuiste naam/wachtwoord combinatie."
	@title = "Login"
   		render 'new'
	else
		sign_in administrator
		redirect_to posts_path
	end
 end

 def destroy
 	sign_out
 	redirect_to root_path
 end

end

