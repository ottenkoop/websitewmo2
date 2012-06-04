class AdministratorsController < ApplicationController 
  before_filter :loggedincheck, only: [:edit, :update, :show]
	def index
		@administrators = Administrator.all
	end

  	def show
    	@administrator = Administrator.find(params[:id])
    	@title = @administrator.name
  	end

  	def new
  		@administrator = Administrator.new
  		@title = "Sign up"
  	end

  	def create
  		@administrator = Administrator.new(params[:administrator])
   		if @administrator.save
    		sign_in @administrator
    		redirect_to @administrator, flash: {succes: "Welkom bij de Sampe App!!!"}
    	else
      		@title = 'Sign Up'
     		render 'new'
    	end
  	end

  	def edit
   		@title = "Aanpassen"
   		@administrator = Administrator.find(params[:id])
  	end

  	def update
    	@administrator = Administrator.find(params[:id])
    	if @administrator.update_attributes(params[:administrator])
      		redirect_to @administrator, flash: {succes: " Je profiel is aangepast"}
    	else
    		@title = "Aanpassen"
    		render 'edit'
  		end
  	end

  	def destroy
		@administrator = Administrator.find(params[:id])
		@administrator.destroy
		redirect_to root_path, :notice => "Hij is verdwenen"
	end

  private

  	def loggedincheck
    	deny_access unless signed_in?
    	
  	end

end
