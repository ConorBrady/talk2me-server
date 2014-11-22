class ConversationMessageController < ApplicationController
	def create
		message = ConversationMessage.create(
			text: params["text"],
			user: @current_user,
			decision: Decision.find(params["decision_id"])
		)

		if message.invalid?
			render json: message.errors.messages, status: :conflict
			return
		end

		respond_to do |format|
			format.json do
				render json: message.as_json
			end
		end
	end
end
