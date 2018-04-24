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
	def create
		@holds = Hold.all
		  respond_to do |format|
		  	@holds.to_a.each do |val|
		  		@u = User.find_by(evo_id: val.evo_id)
		  		if @u
			  		val.name = @u.first + " " + @u.last
			  		val.email = @u.email
					val.c2go = @u.c2go
				end
			end
		    # format.html # don't forget if you pass html
		    format.xls { send_data(@holds.to_a.to_xls) }
		    # format.xls {
		    #   filename = "Posts-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
		    #   send_data(@posts.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
		    # }
		  end
	end
end
