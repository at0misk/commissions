class UsersController < ApplicationController
	def import
		User.import(params[:file])
		redirect_to '/'
		flash[:imported] = "Users Imported"
	end
	def view
		@user = User.find(params[:id])
		@upline_user = User.find_by(evo_id: @user.upline_id) if @user
		@pending = Transaction.where(agent_id: @user.evo_id) if @user
		@upline = Transaction.where(upline_id: @user.evo_id) if @user
		@holds_pending = Hold.where(evo_id: @user.evo_id) if @user
		@upline_holds_pending = Hold.where(evo_id: @upline_user.evo_id) if @upline_user
	end
	def international
		@users = User.where("country != ? or country is null", "US")
	end
end
