class Book < ActiveRecord::Base
	before_validation do
		self.course_code = self.course_code.delete " "
		self.course_code = self.course_code.upcase
	end

	validates :course_code, presence: true, format: { with: /\w+\d{3}/ } 
	validates :title, presence: true
	validates :author, presence: true
	validates :publication_date, presence: true
	validates :seller_email, presence: true
	validates :price, presence: true

end