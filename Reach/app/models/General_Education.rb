
class GE_Requirement
	attr_reader :ge_code
	attr_reader :required_credits
	attr_accessor :fulfilled
	attr_accessor :fulfilling_class
	def initialize(ge_code, required_credits, fulfilled = false, fulfilling_class = nil)
		@ge_code = ge_code
		@required_credits = required_credits
		@fulfilled = fulfilled
		@fulfilling_class = fulfilling_class
	end

    def to_s
        if fulfilled
			return "#{@ge_code}: Fulfilled with: #{@fulfilling_class}. \n"
		else
			return "#{@ge_code}. Fulfilled: #{@fulfilled}. \n"
		end
	end
	
	def fulfillRequirement(fulfilling_class)
		if fulfilling_class.ge_code == @ge_code
			@fulfilling_class = fulfilling_class
			@fulfilled = true
		else
			puts "Unable to fulfill requirement with #{fulfilling_class.course_name}#{fulfulling_class.course_number}."
		end
	end
end

class MathematicsPrepatatoryOne < GE_Requirement
	def initialize
		super("098", 3)
	end
end

class MathmaticsPrepatatoryTwo < GE_Requirement
	def initialize
		super("099", 3)
	end
end

class ArtisticInquiry < GE_Requirement
	def initialize
		super("7AI", 3)
	end
end

class QuantitativeInquiry < GE_Requirement
	def initialize
		super("7QI", 3)
	end
end

class NaturalScienceInquiry < GE_Requirement
	def initialize
		super("7NI", 3)
	end
end

class ValuesEthicalInquiry < GE_Requirement
	def initialize
		super("7VI", 3)
	end
end

class SocialInquiry < GE_Requirement
	def initialize
		super("7SI", 3)
	end
end

class WrittenInquiry < GE_Requirement
	def initialize
		super("7WI", 3)
	end
end

class FreshmanFoundations < GE_Requirement
	def initialize
		super("FFC", 3)
	end
end

class GlobalStudy < GE_Requirement
	def initialize
		super("7GC", 6)
	end
end

class CitizenCommService < GE_Requirement
	def initialize
		super("7CC", 3)
	end
end

class LanguageStudy < GE_Requirement
	def initialize
		super("7LC", 3)
	end
end

class ClusterRequirement < GE_Requirement
	def initialize
		super("Cluster", 12)
	end
end
