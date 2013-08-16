class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			# flash disappears after a request, but a 'render' doesn't count as a request
			# so it stays too long. flash.now makes it go away after the next request.
			# to make flash work, it was defined in the rails console? maybe not.. look in book for details
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
			# Error message
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
