class ReportsController < ApplicationController
	before_filter :authenticate, :only => [:ps451]
	
  def ps451
  	@title = "PS451"
  	@ps451as = Ps451a.paginate(:page => params[:page])
  end

	private
		def authenticate
			deny_access unless signed_in?
		end
end
