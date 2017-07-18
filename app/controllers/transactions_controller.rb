class TransactionsController < ApplicationController
@@transactions = {}
	def import
		Transaction.import(params[:file])
		flash[:imported] = "Commissions imported"
		redirect_to '/transactions'
	end
	def destroy_all
		Transaction.destroy_all
		flash[:imported] = "Commissions cleared"
		redirect_to '/'
	end
	def index
		if @@transactions.length == 0
			@transactions = Transaction.all
		else
			@transactions = @@transactions
		end
		respond_to do |format|
		format.html
		format.xls {
			@transactions.to_a.each do |val|
				val.commission_total = val.commission_total.to_s
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
end
