


class Logger

	attr_reader :errorFile
	attr_reader :warningFile
	attr_reader :debugFile #for running methods

	@logTypes
	@instance

	def self.getInstance
		if @instance == nil
			@instance = Logger.new
		end
		return @instance;
	end

	protected def initialize
		@errorFile = "../../log/errorFile.log"
		@warningFile = "../../log/warningFile.log"
		@debugFile = "../../log/debugFile.log"

		@logTypes = ['e','w','d']
	end


	def write_file(file, logType, thrownClass, thrownMethod, errorMessage, additionalComments)
		target = open(file, 'w') #relative path
		target.write("#{logType} 	 #{thrownClass}		#{thrownMethod} 	#{errorMessage} 	#{additionalComments} \n")
	end


	def writeLogStatement(logType, thrownClass, thrownMethod, errorMessage, additionalComments) 
		if logType == @logTypes[0]
			write_file(@errorFile, logType, thrownClass, thrownMethod, errorMessage, additionalComments = "")
		elsif logType == @logTypes[1]
			write_file(@warningFile, logType, thrownClass, thrownMethod, errorMessage, additionalComments = "")
		elsif logType == @logTypes[2]
			write_file(@debugFile, logType, thrownClass, thrownMethod, errorMessage, additionalComments = "")
		end
	end


end


a = Logger.getInstance
a.writeLogStatement('e', "LogClass", "TestMethod", "Error", "None")

