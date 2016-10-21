module ApplicationHelper
	def header(text)
	  content_for(:header) { text.to_s }
	end
	def javascript(*files)
	  content_for(:head_javascript) { javascript_include_tag(*files) }
	end
	
	def stylesheet(*files)
	  content_for(:head_stylesheet) { stylesheet_link_tag(*files) }
	end
end
