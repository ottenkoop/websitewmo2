module SessionsHelper
	def sign_in(administrator)
		cookies.signed[:remember_token] = [administrator.id, administrator.salt]
		current_administrator = administrator
	end

	def current_administrator=(administrator)
		@current_administrator = administrator
	end

	def current_administrator
		@current_administrator ||= administrator_from_remember_token
	end

	def signed_in?
		!current_administrator.nil?
	end

	def sign_out
		cookies.delete(:remember_token)
		current_administrator = nil
	end

	def current_administrator?(administrator)
		administrator == current_administrator
	end

	def authenticate
    deny_access unless signed_in?
  end

	 def deny_access
		store_location
     	redirect_to root_path, notice: "U heeft geen toegang tot de pagina die u probeerde te benaderen."
  	end

  	def store_location
  		session[:return_to] = request.fullpath
  	end

  	def redirect_back_or(default)
  		redirect_to(session[:return_to] || default)
  		clear_return_to
  	end

  	def clear_return_to
  		session[:return_to] = nil	
  	end

	private 

	def administrator_from_remember_token
		Administrator.authenticate_with_salt(*remember_token)
	end

	def remember_token
		cookies.signed[:remember_token] || [nil, nil]
	end
end

