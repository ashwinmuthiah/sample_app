module SessionsHelper

	# create the cookie remember token to compare to db, and encrypt it for comparison
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	# Check if a user is signed in. If current_user is blank, then we
	# know that the user is not signed in
	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	# Identify current user by comparing remmeber tokens and keeping the same current
	# user if that's already been identified (see '||=' meaning)
	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by_remember_token(remember_token)
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end
