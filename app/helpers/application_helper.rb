module ApplicationHelper

	def current(value)
		if params[:controller] == value
			'current'
		end
	end

  def date(current_date)
    current_date.strftime("%d/%m/%Y")
  end
end
