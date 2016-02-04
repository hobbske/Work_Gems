class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
		user = User.from_omniauth(request.env["omniaut.auth"])
	end
	alias_method :twitter, :all
	alias_method :facebook, :all
	alias_method :linkedin, :all


end
