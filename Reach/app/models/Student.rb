


class Student 

	attr_reader :studentUsername
	attr_accessor :studentPassword
	attr_accessor :studentEmail
	attr_accessor :studentFirstName
	attr_accessor :studentLastName
	attr_accessor :studentMiddleInitial
	attr_accessor :studentMajor


	def initialize(user, pass, email, firstName, lastName, middleInitial, major = "undeclared")
 		@studentUsername = user
 		@studentPassword = pass
 		@studentEmail = email
 		@studentFirstName = firstName
 		@studentLastName = lastName
 		@studentMiddleInitial = middleInitial
 		@studentMajor = major
	end


end
