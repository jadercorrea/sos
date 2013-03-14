module ApplicationHelper

	def current(value)
		if params[:controller] == value
			'current'
		end
	end

end
