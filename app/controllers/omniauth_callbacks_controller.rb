class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	skip_before_action :authenticate_user!

	def all
		p env['omniauth.auth']
		user=User.from_omniauth(env["omniauth.auth"], current_user)
		if user.persisted?
			flash[:notice] = "Like the D&D club in high school, you are in! Go to edit profile to see the status for your accounts."
			sign_in_and_redirect(user)
		else
			session["devise.user_attributes"] = user.user_attributes
			redirect_to new_user_registration_url
		end
	end

	def failure
		#add logic here
		super
	end

	alias_method :facebook, :all
	alias_method :twitter, :all
	alias_method :github, :all
	alias_method :linkedin, :all
	# alias_method :google_oauth2, :all

end