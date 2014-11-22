class ProblemController < ApplicationController

	def index

		problems = Problem.find(:all)

		problems = problems.select do |p|
			!p.decisions.any? { |d| d.user == @current_user }
		end

		respond_to do |format|
			format.json do
				render json: problems.as_json( only: [:id, :title, :description] )
			end
		end
	end

	def create
		problem = Problem.create(
			user: @current_user,
			title: params[:title],
			description: params[:destription]
		)

		if problem.invalid?
			render json: problem.errors.messages, status: :bad_request
			return
		end

		respond_to do |format|
			format.json do
				render json: problem.as_json( only: [:id, :title, :description])
			end
		end
	end
end
