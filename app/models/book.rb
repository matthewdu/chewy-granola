class Book < ActiveRecord::Base
	before_validation { self.course_code = self.course_code.delete " " }

	validates :course_code, presence: true, format: { with: /\w+\d{3}/ } 
	validates :title, presence: true
	validates :author, presence: true
	validates :published_date, presence: true
	validates :seller_email, presence: true

end