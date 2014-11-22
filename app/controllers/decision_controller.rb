class DecisionController < ApplicationController

	def index

		decisions = Decision.where(outcome: params[:outcome]).find(:all)


		respond_to do |format|
			format.json do
				render json: decisions.as_json(only: [:id, :title, :description])
			end
		end
	end

	def show
		decision = Decision.find(params[:id])
		respond_to do |format|
			format.json do
				render json: decision.as_json(
					include:
						[
							:conversation_message,
							:problem
							]
				)
			end
		end
	end

	def create
		decision = Decision.create(
			user: @current_user,
			problem: Problem.find(params[:problem_id]),
			outcome: params[:outcome]
		)

		if decision.invalid?
			render json: decision.errors.messages, status: :conflict
			return
		end

		respond_to do |format|
			format.json do
				render json: decision.as_json
			end
		end
	end
end
