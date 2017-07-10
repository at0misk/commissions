class HoldsController < ApplicationController
	def import
	  Hold.import(params[:file])
	  flash[:imported] = "Holds imported"
	  redirect_to '/'
	end
	def index
		@holds = Hold.all
	end
	def destroy_all
		Hold.destroy_all
		flash[:imported] = "Holds cleared"
		redirect_to '/'
	end
end
