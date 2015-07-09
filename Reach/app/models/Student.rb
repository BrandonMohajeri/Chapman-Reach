




class Student 

	attr_reader :studentUsername
	attr_accessor :studentGender
	attr_accessor :studentYear
	attr_accessor :studentPassword
	attr_accessor :studentEmail
	attr_accessor :studentFirstName
	attr_accessor :studentLastName
	attr_accessor :studentMiddleInitial


	def initialize(user, pass, email, firstName, lastName, middleInitial, gender, year, major = "undeclare")
 		@studentUsername = user
 		@studentPassword = pass
 		@studentEmail = email
 		@studentFirstName = firstName
 		@studentLastName = lastName
 		@studentMiddleInitial = middleInitial
 		@studentGender = gender
 		@studentYear = year
 		@studentMajor = new Major(major);
 		@studentCompleteClasses = Array.new;
 	
	end


end
