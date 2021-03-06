module Api
	module V1
		class BooksController < ApplicationController

			def index
				if params[:course_code]
					book = Book.where(course_code: params[:course_code])
				else
					book = Book.all
				end
				render json: book
			end

			def create
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
				book = Book.find(params[:id])
				if book.update_attributes(book_params)
					render json: book
				else
					render json: {message: 'Error'}
				end
			rescue ActiveRecord::RecordNotFound
				render json: {message: 'RecordNotFound'}
			end

			def destroy
				book = Book.find(params[:id]).destroy
				render json: book
				rescue ActiveRecord::RecordNotFound
				render json: {message: 'RecordNotFound'}
			end

			private
			def book_params
				params.require(:book).permit(:course_code, :title, :author, :publisher, :publication_date, :seller_name, :seller_email, :seller_phone_number, :price)
			end

		end
	end
end