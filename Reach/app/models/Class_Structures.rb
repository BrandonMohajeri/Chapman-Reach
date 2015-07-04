require_relative 'General_Education'

class GenericCluster
	attr_reader :cluster_name
	attr_reader :classes 

	def initialize(class_cluster_name, classes_hash)
		@cluster_name = class_cluster_name
		if classes_hash.is_a? Array
			@classes = Hash.new(false)
			classes.hash.each do |temp|
				@classes[temp] = false
			end
		else
			@classes = classes_hash.clone
		end
	end

	def to_s
		hold = @cluster_name.to_s + "\n"
		@classes.each do |key, value|
			hold << "#{key}. Taken: #{value} #{key.grade} \n"
		end
		return hold
	end
end


class Cluster < GenericCluster

end


class Minor

end


class Major
	def initialize
		@ge_requirements = GERequirements.new
		@lower_divisions = LowerDivisionRequirements.new
		@upper_divisions = UpperDivisionRequirements.new
		@generic_requirements = GenericRequirement.new
	end
end

class LowerDivisionRequirements < GenericCluster
	def initialize(requirements)
		super ("Lower Division Requirements", requirements)
	end
end

class UpperDivisionRequirements < GenericCluster
	def initialize(requirements)
		super ("Upper Division requirements", requirements)
	end
end

class GenericRequirement < GenericCluster
	def initialize(name_of_requirement, requirements)
		super(name_of_requirement, requirements)
	end
end

class GERequirements < GenericCluster
	def initialize
		super("General Education", [MathematicsPrepatatoryOne.new,MathmaticsPrepatatoryTwo.new,ArtisticInquiry.new,QuantitativeInquiry.new,NaturalScienceInquiry.new,ValuesEthicalInquiry.new,SocialInquiry.new,WrittenInquiry.new,FreshmanFoundations.new,GlobalStudy.new,CitizenCommService.new,LanguageStudy.new,ClusterRequirement.new])
	end
end

class MajorElectives < GenericCluster
	def initialize(requirements)
		super ("Electives", requirements)
	end
end
