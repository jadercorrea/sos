module EventHelper
  def todays_events(events, day)
    events.select { |e| e.start_datetime.day == day }
  end
end
