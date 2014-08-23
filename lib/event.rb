class Event < ActiveRecord::Base

  def self.future
    Event.where(:start => Time.now..'2400/01/01 12:00:00').sort_by_date
  end

end
