module Api
	module V1
		class BooksController < ApplicationController

			def index
				render json: {message: 'Resource not found'}, status: 404
			end

			def create
				binding.pry
				book = Book.new(book_params)
				if book.save
					render json: book
				else
					render json: {message: 'Error'}
				end
			end

			def show
				book = Book.find(params[:id])
				render json: book
				rescue ActiveRecord::RecordNotFound
				render json: {message: 'RecordNotFound'}
			end

			def update
			end

			def destroy
			end

			private
			def book_params
				params.require(:book).permit(:course_code, :title, :author, :publisher, :published_date, :seller_name, :seller_email, :seller_phone_number)
			end

		end
	end
end