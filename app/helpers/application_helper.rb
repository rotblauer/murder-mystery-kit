module ApplicationHelper
	def flash_class(level)
	  case level.to_sym
	  when :success then "alert alert-success"
	  when :notice then "alert alert-info"
	  when :info then "alert alert-info"
	  when :warning then "alert info-warning"
  	when :alert then "alert alert-warning"
	  when :error then "alert alert-danger"
  	when :danger then "alert alert-danger"
	  end
	end
end
