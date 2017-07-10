class TransactionsController < ApplicationController
	def import
		Transaction.import(params[:file])
		flash[:imported] = "Commissions imported"
		redirect_to '/transactions'
	end
	def destroy_all
		Transaction.destroy_all
		redirect_to '/'
	end
	def index
		@transactions = Transaction.all
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
	def download
		@transactions = Transaction.all
		  respond_to do |format|
		    # format.html # don't forget if you pass html
		    format.xls { send_data(@transactions.to_a.to_xls) }
		    # format.xls {
		    #   filename = "Posts-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
		    #   send_data(@posts.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
		    # }
		  end
	end
end
