class UserController < ApplicationController

	skip_before_filter :authenticate, only: [:create]


	def create

		user = User.create(
		email: params[:email],
		password: params[:password],
		password_confirmation: params[:password_confirmation] )
		if user.invalid?

			if user.errors.keys.include? :email and user.errors[:email].include? "has already been taken"
				render json: user.errors.messages, status: :conflict
				return
			else
				render json: user.errors.messages, status: :bad_request
				return
			end
		end

		respond_to do |format|
			format.json do
				render json: user.as_json( only: [ :email ] )
			end
		end
	end
end
