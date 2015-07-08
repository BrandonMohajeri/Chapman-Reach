require_relative 'WebScraperChapman'

class SchmidMajorScraper < WebScraper
	def initialize
		super("http://www.chapman.edu/catalog/oc/current/ug/content/9073.htm#o4197")
	end
	def scrape_majors
		keystring_start = "<h2 class=\"heading2\">"
		keystring_end = "</h2>"
		values = scrape_webpage(keystring_start, keystring_end)
		count = 1
		allMajors = Hash.new
		values.each do |param|
		    if (param.index("Bachelor") == nil && param.index("Degree") == nil)
		        count += 1
		        next
		    end
		    if ((values.length-1) == count)
		        break
		    end
		    if values[count] == nil
		        end_value = @web_contents.rindex("</html>")
		    else
		        end_value = @web_contents.rindex(values[count])
		    end
		    major_name = param
		    hold = @web_contents.rindex(param)
		    ret = scrape_sections(hold, end_value)
            count += 1
            allMajors[major_name] = ret
		end
		allMajors
	end
	
	def get_substr(keystring_start, keystring_end, hold)
	    temp = @web_contents.index(keystring_start, hold) + keystring_start.length
		hold = @web_contents.index(keystring_end, temp)
		return [@web_contents[temp, (hold-temp)], hold]    
	end
	
	def scrape_sections(hold, end_major)
	    return_value = Hash.new([])
	    keystring_start = "<p class=\"bodytextextraspace\"><span class=\"none\">"
	    keystring_end = "</p>"
	    
	    while hold < end_major
    	    temp = @web_contents.index(keystring_start, hold) + keystring_start.length
    	    hold = @web_contents.index(keystring_end, temp)
    	    end_value = @web_contents.index(keystring_start, hold)
    	    ret = @web_contents[temp, (hold-temp)]
    	    while true
    	        s1 = ret.sub!("&#8211;", "-")
    	        s2 = ret.sub!("\"", "")
    	        if (s1==nil && s2 == nil)
    	            break
    	        end
    	    end
    	    while true
    	        s1 = ret.index("<")
    	        if (s1 == nil)
    	            break
    	        end
    	        s2 = ret.index(">")
    	        temp = ret[s1, (s2-s1)+1]
    	        ret.sub!(temp, "")
    	    end
    	    return_value[ret] = scrape_class(hold, end_value)
    	    if (end_value > end_major)
    	        break
    	    end
    	end
        return_value
	end
	
	def scrape_class(hold, end_value)
	    ret_arr = []
	    while true
    		keystring_start = "target=\"_self\">"
    		keystring_end = "</a>"
    		course_temp = get_substr(keystring_start, keystring_end, hold)
    		hold = course_temp[1]
    		course_temp = course_temp[0].split(" ")
    		course_type = course_temp[0]
    		course_number = course_temp[1].to_i
            keystring_start = "<td width=\"336\"><p class=\"chart\">"
            keystring_end = "</p>"
            course_temp = get_substr(keystring_start, keystring_end, hold)
            course_name = course_temp[0]
            course_name.sub!("&#8211;", "-")
            course_name.sub!("&nbsp;", "3")
            hold = course_temp[1]
            #the keystring_end should be the same
            keystring_start = "<td width=\"42\"><p class=\"chartcredits\">"
            course_temp = get_substr(keystring_start, keystring_end, hold)
            credits = course_temp[0]
            credits.sub!("&#8211;", "-")
            credits.sub!("&nbsp;", "3")
            credits.sub!("3,1", "4")
            unless credits == '1-6'
            	credits = credits.to_i
            else
            	credits = (1..6).to_a
            end
            hold = course_temp[1]
            if (hold > end_value)
                break
            end
            ret_arr << [course_type, course_number, course_name, credits]
        end
	    ret_arr
	end
	def scrape_minors
		keystring_start = "<h3 class=\"heading3\">"
		keystring_end = "</h3>"
		values = scrape_webpage(keystring_start, keystring_end)
		puts values
	end

    def scrape_webpage(keystring_start, keystring_end)
        return super(keystring_start, keystring_end)
    end

end


# @test = SchmidMajorScraper.new;
# File.open("output.res", 'w'){|file| file.write(@test.scrape_majors)}