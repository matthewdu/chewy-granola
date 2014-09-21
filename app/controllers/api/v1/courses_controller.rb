module Api
	module V1
		class CoursesController < ApplicationController
			
			def index
				unless params[:course_code].nil?
					courseCode = params[:course_code].upcase
				else
					courseCode = ''
				end
				redis = Redis.new
				courses = redis.zrangebylex('autocomplete', '['+courseCode, '['+courseCode+'\xff')
				render json: courses
			end

			def update
				subjectsJSON = RestClient.get 'https://api.uwaterloo.ca/v2/codes/subjects.json', {params: {key: '2513688448cafa644d4de55fb11699ae'}}
				subjectsJSON = JSON.parse subjectsJSON
				subjectsData =  subjectsJSON['data']
				
				courses = []

				subjectsData.each do |subjectHash|
					apiAddress = "https://api.uwaterloo.ca/v2/courses/{subject}.json"
					apiAddress = apiAddress.gsub '{subject}', subjectHash['subject']
					coursesJSON = RestClient.get apiAddress, {params: {key: '2513688448cafa644d4de55fb11699ae'}}
					coursesJSON = JSON.parse coursesJSON
					coursesData = coursesJSON['data']

					coursesData.each do |courseHash|
						courses << courseHash['subject'] + courseHash['catalog_number']
						redis = Redis.new
						redis.zadd("autocomplete", 0, courseHash['subject'] + courseHash['catalog_number'])
					end
				end

				render json: courses
			end

		end
	end
end