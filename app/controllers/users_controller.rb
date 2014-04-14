class UsersController < ApplicationController
	def new
		@user=User.new
	end
	def create
		@user=User.new(post_params(params))
		if @user.save
			redirect_to @user,notice:"Thank you for signing up for Ribbit."
		else
			render 'new'
		end
	end

	def show
		@user=User.find(params[:id])
		@ribbit=Ribbit.new
		
	end

	def destroy

	end
	private
	def post_params(params)
		params.require(:user).permit(:avatar_url,:bio,:email,:name,:password,:password_confirmation ,:username)
	end
end
