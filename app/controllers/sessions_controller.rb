class SessionsController < ApplicationController
	skip_before_action :authorize
  def new
  end

  def create
  	user = User.find_by(name: param[:name])
  	if user and user.authenticate(param[:password])
  		redirect_to_admin_url
  	else
  		redirect_to login_url.alert: "Invalid username or password"
  	end

  	def destroy
  		session[:user_id] = nil
  		redirect_to login_url, alert:"Successfully logged out"
  	end

  end
end
