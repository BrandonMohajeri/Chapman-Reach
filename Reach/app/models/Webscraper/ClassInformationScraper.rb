require_relative "WebScraperChapman"

class ClassInformationScraper < WebScraper

	def initialize (webpage)
		super(webpage)
	end

	def scrape_for_class(keystring_start, keystring_end)

	end


	def scrape_course_description
		hold = 0
		hold2 = 0
		keystring_start = "Course Description -"
		keystring_end = "</h2>"
		values = scrape_webpage(keystring_start, keystring_end)
		# while hold < @webpage.length do 
		# 	index = @webpage.index(keystring, hold)
		# 	if index == nil
		# 		break
		# 	end
		# 	hold = index + (keystring.length)
		# 	hold2 = @webpage.index(keystring, hold2)
		# 	if hold2 == nil
		# 		break
		# 	end
		# 	hash[]
		# end
		values
	end

end


test = ClassInformationScraper.new("http://www.chapman.edu/catalog/oc/current/ug/content/9074.htm#o4235")
File.open("classoutput.res", 'w'){|file| file.write(test.scrape_course_description)}
