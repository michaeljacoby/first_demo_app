module ApplicationHelper

# Return a title on a perpage basis.

def title
   base_title = "Demo_App"
   if @title.nil?
     base_title
	 else
	 "#{base_title} | #{@title}"
	end
   end
end
