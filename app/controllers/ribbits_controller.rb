class RibbitsController < ApplicationController

	def create
		ribbit=Ribbit.new(post_params(params))
		ribbit.user_id=current_user.id
		flash[:error]="Your Ribbit was over 140 characters." unless ribbit.save
		redirect_to root_url
	end

	private
	def post_params(params)
		params.require(:ribbit).permit(:user_id,:content)
	end

end
