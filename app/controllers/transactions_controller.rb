class TransactionsController < ApplicationController
@@transactions = {}
	def import
		Transaction.import(params[:file])
		flash[:imported] = "Commissions imported"
		redirect_to '/transactions'
	end
	def destroy_all
		Transaction.destroy_all
		@@transactions = {}
		flash[:imported] = "Commissions cleared"
		redirect_to '/'
	end
	def index
			if session[:page] == "upline" || session[:page] == "order" || session[:page] == "int"
				@transactions = @@transactions
				session[:page] = nil
				flash[:filtered] = true
			else
				@transactions = Transaction.where.not(agent_total: 0)
				session[:page] = 'all'
			end
			respond_to do |format|
			format.html
			format.xls {
				if session[:page] == 'int'
					@transactions = Transaction.where("country != ? or country is null", "US")
					@transactions.to_a.each do |val|
						val.commission_total = val.commission_total.to_s
						val.c2go = "INTERNATIONAL"
					end
				else
					@transactions.to_a.each do |val|
						val.commission_total = val.commission_total.to_s
					end
				end
				# session[:page] = 'all'
				send_data(@transactions.to_a.to_xls) 
			}
			end 
		# format.xls { send_data(@transactions.to_xls) }
	end
	def create
		if session[:page] == 'int'
			@transactions = Transaction.where("country != ? or country is null", "US")
		elsif flash[:filtered]
			@transactions = @@transactions
		elsif session[:page] == 'all'
			@transactions = Transaction.all
		end
		  respond_to do |format|
		  	@transactions.to_a.each do |val|
		  		@u = User.find_by(evo_id: val.agent_id)
		  		@upline = User.find_by(evo_id: val.upline_id)
		  		if @upline
			  		val.sponsor_c2go = @upline.c2go if @upline.c2go
			  		val.sponsor_name = @upline.first + " " + @upline.last if @upline.first && @upline.last
			  	end
		  		val.agent_name = @u.first + " " + @u.last if @u.first && @u.last
		  		if @u.processed
					val.processed = true
				else
					val.processed = false
				end
				if session[:page] == 'int'
					val.c2go = "International"
				else
					val.c2go = @u.c2go
				end
			end
		    # format.html # don't forget if you pass html
		    format.xls { send_data(@transactions.to_a.to_xls) }
		    # format.xls {
		    #   filename = "Posts-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
		    #   send_data(@posts.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
		    # }
		  end
	end
	def international
		session[:page] = 'int'
		@transactions = Transaction.where("country != ? or country is null", "US")
	end
	def key_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(key: :desc)
		redirect_to "/transactions"
	end
	def key_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:key)
		redirect_to "/transactions"
	end
	def invoice_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(invoice: :desc)
		redirect_to "/transactions"
	end
	def invoice_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:invoice)
		redirect_to "/transactions"
	end
	def agent_id_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(agent_id: :desc)
		redirect_to "/transactions"
	end
	def agent_id_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:agent_id)
		redirect_to "/transactions"
	end
	def issue_date_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(issue_date: :desc)
		redirect_to "/transactions"
	end
	def issue_date_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:issue_date)
		redirect_to "/transactions"
	end
	def itinerary_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(itinerary: :desc)
		redirect_to "/transactions"
	end
	def itinerary_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:itinerary)
		redirect_to "/transactions"
	end
	def commission_total_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(commission_total: :desc)
		redirect_to "/transactions"
	end
	def commission_total_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:commission_total)
		redirect_to "/transactions"
	end
	def agent_total_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(agent_total: :desc)
		redirect_to "/transactions"
	end
	def agent_total_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:agent_total)
		redirect_to "/transactions"
	end
	def upline_total_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(upline_total: :desc)
		redirect_to "/transactions"
	end
	def upline_total_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:upline_total)
		redirect_to "/transactions"
	end
	def evo_total_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(upline_total: :desc)
		redirect_to "/transactions"
	end
	def evo_total_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:upline_total)
		redirect_to "/transactions"
	end
	def processed_up
		session[:page] = 'order'
		@@transactions = Transaction.all.order(processed: :desc)
		redirect_to "/transactions"
	end
	def processed_down
		session[:page] = 'order'
		@@transactions = Transaction.all.order(:processed)
		redirect_to "/transactions"
	end
	# def active_up
	# 	@@transactions = Transaction.all.order(active: :desc)
	# 	redirect_to "/transactions"
	# end
	# def active_down
	# 	@@transactions = Transaction.all.order(:active)
	# 	redirect_to "/transactions"
	# end
	# def c2go_id_up
	# 	@@transactions = Transaction.all.order(c2go: :desc)
	# 	redirect_to "/transactions"
	# end
	# def c2go_id_down
	# 	@@transactions = Transaction.all.order(:c2go)
	# 	redirect_to "/transactions"
	# end
	def create_upline_transactions
		@@transactions = []
		@upline_ids = User.distinct.pluck(:upline_id)
			@upline_ids.each do |val_user|
				@transactions = Transaction.where("upline_id = ?", "#{val_user}")
				@transactions.each do |val_transaction|
					@@transactions << val_transaction
				end
			end
		flash[:uplines] = true
		session[:page] = "upline"
		redirect_to "/transactions"
	end
	def update_active_status
		@transactions = Transaction.all
		@transactions.each do |val|
			user = User.find_by(evo_id: val.agent_id)
			@transaction.update_attribute(:active, user.active)
			@transaction.save
		end
		@transactions = Transaction.all
		@transactions.each do |val|
			user = User.find(val.user_id)
			@transaction.update_attribute(:active, user.active)
			@transaction.save
		end
		redirect_to "/"
	end
end
