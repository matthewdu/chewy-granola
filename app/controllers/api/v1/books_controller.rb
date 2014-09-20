module Api
	module V1
		class BooksController < ApplicationController

			def index
				render json: {message: 'Resource not found'}, status: 404
			end

			def create
			end

			def show
			end

			def update
			end

			def destroy
			end

		end
	end
end