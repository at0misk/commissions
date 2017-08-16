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
		Transaction.where(agent_id: @user.evo_id).destroy_all
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
	def users_download
		@users = User.all
		@retained = BigDecimal.new("0")
		@users.each do |val|
			if !val.active
				@upline_commissions = Transaction.where(upline_id: val.evo_id)
				@upline_commissions.each do |com_val|
					@retained += BigDecimal.new(com_val.upline_total).round(2)
				end
			end
		end
	end
	def create
		respond_to do |format|
			format.html
			format.xls {
					@users = User.all.select("evo_id, revenue_type, c2go, first, last, agent_total, evo_total, active")
					@ret_arr = []
					@users.to_a.each do |val|
						@commissions = Transaction.where(agent_id: val.evo_id)
						@total = BigDecimal.new("0")
						@evo_total = BigDecimal.new("0")
						@upline_total = BigDecimal.new("0")
						@commissions.each do |com_val|
							@total += BigDecimal.new(com_val.agent_total).round(2)
							@evo_total += BigDecimal.new(com_val.evo_total).round(2)
							val.revenue_type = com_val.revenue_type
						end
						if val.active
							@upline_commissions = Transaction.where(upline_id: val.evo_id)
							@upline_commissions.each do |com_val|
								@total += BigDecimal.new(com_val.upline_total).round(2)
							end
						end
						@holds_pending = Hold.where(evo_id: val.evo_id)
						@holds_pending.each do |com_val|
							@total += BigDecimal.new(com_val.paid_agent)
						end
						val.agent_total = @total
						val.evo_total = @evo_total
					end
					@users.order(agent_total: :desc)
				# session[:page] = 'all'
				send_data(@users.to_a.to_xls) 
			}
		end 
	end
end
