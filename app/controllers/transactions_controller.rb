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
		session[:page] = 'all'
		if @@transactions.length == 0
			@transactions = Transaction.all
		else
			@transactions = @@transactions
		end
		respond_to do |format|
		format.html
		format.xls {
			if session[:page] == 'all'
				@transactions.to_a.each do |val|
					val.commission_total = val.commission_total.to_s
				end
				send_data(@transactions.to_a.to_xls) 
			elsif session[:page] == 'int'
					@transactions = Transaction.where("country != ? or country is null", "US")
				@transactions.to_a.each do |val|
					val.commission_total = val.commission_total.to_s
					val.c2go = "INTERNATIONAL"
				end
			end
			send_data(@transactions.to_a.to_xls) 
		}
		end 
		# format.xls { send_data(@transactions.to_xls) }
	end
	def create
		@transactions = Transaction.all
		  respond_to do |format|
		  	@transactions.to_a.each do |val|
		  		@u = User.find_by(evo_id: val.agent_id)
		  		if @u.processed
					val.processed = true
				else
					val.processed = false
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
		@@transactions = Transaction.all.order(key: :desc)
		redirect_to "/transactions"
	end
	def key_down
		@@transactions = Transaction.all.order(:key)
		redirect_to "/transactions"
	end
	def invoice_up
		@@transactions = Transaction.all.order(invoice: :desc)
		redirect_to "/transactions"
	end
	def invoice_down
		@@transactions = Transaction.all.order(:invoice)
		redirect_to "/transactions"
	end
	def agent_id_up
		@@transactions = Transaction.all.order(agent_id: :desc)
		redirect_to "/transactions"
	end
	def agent_id_down
		@@transactions = Transaction.all.order(:agent_id)
		redirect_to "/transactions"
	end
	def issue_date_up
		@@transactions = Transaction.all.order(issue_date: :desc)
		redirect_to "/transactions"
	end
	def issue_date_down
		@@transactions = Transaction.all.order(:issue_date)
		redirect_to "/transactions"
	end
	def itinerary_up
		@@transactions = Transaction.all.order(itinerary: :desc)
		redirect_to "/transactions"
	end
	def itinerary_down
		@@transactions = Transaction.all.order(:itinerary)
		redirect_to "/transactions"
	end
	def commission_total_up
		@@transactions = Transaction.all.order(commission_total: :desc)
		redirect_to "/transactions"
	end
	def commission_total_down
		@@transactions = Transaction.all.order(:commission_total)
		redirect_to "/transactions"
	end
	def agent_total_up
		@@transactions = Transaction.all.order(agent_total: :desc)
		redirect_to "/transactions"
	end
	def agent_total_down
		@@transactions = Transaction.all.order(:agent_total)
		redirect_to "/transactions"
	end
	def upline_total_up
		@@transactions = Transaction.all.order(upline_total: :desc)
		redirect_to "/transactions"
	end
	def upline_total_down
		@@transactions = Transaction.all.order(:upline_total)
		redirect_to "/transactions"
	end
	def evo_total_up
		@@transactions = Transaction.all.order(upline_total: :desc)
		redirect_to "/transactions"
	end
	def evo_total_down
		@@transactions = Transaction.all.order(:upline_total)
		redirect_to "/transactions"
	end
	def processed_up
		@@transactions = Transaction.all.order(processed: :desc)
		redirect_to "/transactions"
	end
	def processed_down
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
end
