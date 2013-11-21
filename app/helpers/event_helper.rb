module EventHelper
  def todays_events(events, day, month, year)
    events.select { |e| e.start_datetime.day == day && e.start_datetime.month == month && e.start_datetime.year == year }
  end

  def next_month(month)
    month += 1
    month = 1 if month > 12
    month 
  end
      
  def next_year(month, year)
    next_year = year 
    next_year += 1 if (month += 1) > 12
    next_year  
  end

  def previous_month(month)
    month -= 1
    month = 12 if month < 1
    month 
  end
      
  def previous_year(month, year)
    next_year = year 
    next_year -= 1 if (month -= 1) < 1
    next_year  
  end

  def month_name(month_number)
    [
      '','', 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
    ][month_number + 1]
  end
end
