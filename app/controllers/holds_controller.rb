class HoldsController < ApplicationController
	def import
	  Hold.import(params[:file])
	  flash[:imported] = "Holds imported"
	  redirect_to '/'
	end
	def index
		@holds = Hold.all
	end
end
