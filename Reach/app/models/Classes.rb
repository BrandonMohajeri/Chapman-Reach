
class GenericClass
	attr_reader :course_name
	attr_reader :course_number
	attr_reader :credits
	attr_reader :ge_codes
	attr_accessor :grade
	attr_accessor :prerequisites
	attr_accessor :postrequisites

	def initialize(name, type, number, credits, prerequisites = nil, postrequisites = [], ge_codes = [])
		@course_name = name
		@course_type = type
		@course_number = number
		@credits = credits
		@grade = grade
		#hash, holds both class and whether the class has been taken (bool)
		@prerequisites = prerequisites.clone
		#array
		@postrequisites = postrequisites.clone
		#array
		@ge_codes = ge_codes.clone
		@unique_id = Random.new.rand(100000000) + 10000000
	end
end

class 

                                        
class FinishedClass < GenericClass
	def initialize(name, type, number, credits, prequisistes = [], postrequisistes = [], ge_codes = [], grade = 0.00)
		super(name, type, number, credits, prequisistes, postrequisistes, ge_codes)
	end
end

class InProgressClass < GenericClass
	def initialize(name, type, number, credits, prerequisites = [], postrequisites = [], ge_codes = [])
		super(name, number, credits, prequisistes, postrequisistes, ge_codes)	
	end
end
