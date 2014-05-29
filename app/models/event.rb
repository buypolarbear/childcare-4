class Event < ActiveRecord::Base
  belongs_to :child
  
  scope :between, lambda {|start_time, end_time|
    {:conditions => ["? < starts_at < ?", Event.format_date(start_time), Event.format_date(end_time)] }
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

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
  
  def duration()
    (self.end.to_f - self.start.to_f).to_formatted_s(:db)
  end
  
  def duration_rounded(seconds = 60)
    duration = (self.end.to_f - self.start.to_f)
	duration = (duration / seconds).round * seconds
  end
end
