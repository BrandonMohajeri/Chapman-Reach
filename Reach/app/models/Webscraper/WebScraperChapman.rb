require 'open-uri'

#

class WebScraper
    attr_reader :web_contents
	def initialize(website_to_scrap)
		@web_contents = open(website_to_scrap){|f| f.read}
	end

	def scrape_webpage(keystring_start, keystring_end)
		hold = 0
		hold2 = 0
		arr = Array.new
		while hold < @web_contents.length do
		    index1 = @web_contents.index(keystring_start, hold)
		    if index1 == nil
		        break
		    end
		    hold = index1 + (keystring_start.length)
		    hold2 = @web_contents.index(keystring_end, hold2)
		    if hold2 == nil
		        break
		    end
		    arr << @web_contents[hold, (hold2-hold)]
		    hold2 += keystring_end.length
		end
		return arr
	end	
end

