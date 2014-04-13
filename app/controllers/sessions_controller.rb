class SessionsController < ApplicationController
  def create
  	user=User.find_by_username(params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id]=user.user_id
  		redirect_to root_user,notice: "Logged In!"
  	else
  		flash[:error]="Wrong username/password"
  		redirect_to root_user
  	end
  end

  def destroy
  	session[:user_id]=nil
  	redirect_to root_user,notice: "Logged Out."
  end
end
