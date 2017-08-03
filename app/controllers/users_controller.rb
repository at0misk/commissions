class UsersController < ApplicationController
	def import
		if params['inactive']
			User.import(params[:file], true)
		else
			User.import(params[:file], false)
		end
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
		session[:page] = 'int'
		@users = User.where("country != ? or country is null", "US")
	end
	def process_user
		@user = User.find(params['user_id'])
		@ret_ids_array = JSON.parse(params['retain_ids'])
		@to_destroy = []
		@holds = Hold.where(evo_id: @user.evo_id)
		@holds.each do |val|
			found = false
			@ret_ids_array.each do |inner_val|
				if val.id == inner_val.to_i
					found = true
				else
				end
			end
			if found
			else
				@to_destroy << val
			end
		end
		@to_destroy.each do |val|
			val.destroy
		end
		@user.update_attribute(:processed, true)
		redirect_to "/users/#{@user.id}"
	end
	def unprocess_user
		@user = User.find(params['id'])
		@user.update_attribute(:processed, false)
		redirect_to "/users/#{@user.id}"
	end
	def search
		@user = User.find_by(evo_id: params['id'])
		if @user
			redirect_to "/users/#{@user.id}" and return
		else
			flash[:imported] = "No user found"
			redirect_to "/transactions" and return
		end
	end
end
