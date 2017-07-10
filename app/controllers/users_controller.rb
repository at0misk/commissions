class UsersController < ApplicationController
	def import
		User.import(params[:file])
	end
end
