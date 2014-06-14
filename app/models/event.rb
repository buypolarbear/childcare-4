class Event < ActiveRecord::Base
  belongs_to :child
  
  #############################################
  # Enables Event.between(Time, Time) (scoped
  # searching)
  ##############################################
  scope :between, lambda { |start_time, end_time|
	where("start BETWEEN ? AND ?", Event.format_date(start_time), Event.format_date(end_time))
  }

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description || "",
      :start => self.start.rfc822,
      :end => self.end.rfc822,
      :allDay => self.all_day,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.event_path(id),
      #:color => "red"
    }

  end

  #############################################
  # Pretty print the date
  ##############################################
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:long_ordinal)
  end
  
  
  
  
  
  #############################################
  # Returns the duration of the current event
  # in seconds
  ##############################################
  def duration()
    self.end.to_f - self.start.to_f
  end
  
  
  #############################################
  # Returns the duration of the current event
  # in seconds, rounded to the nearest time
  # period passed. If "30.minutes" is passed,
  # the duration will be rounded to the nearest
  # 30 minutes (but still returned in seconds).
  # If no parameter is passed, the duration will
  # not be rounded.
  ##############################################
  def duration_rounded(seconds = 60)
    duration = (self.end.to_f - self.start.to_f)
	duration = (duration / seconds).round * seconds
  end
end
