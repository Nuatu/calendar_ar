class Event < ActiveRecord::Base

  def self.future
    Event.where(:start => Time.now..'2400/01/01 12:00:00').sort_by_date
  end

  def self.view_day(attributes = {:year => Time.now.year, :month => Time.now.month, :day => Time.now.day})
    today = Date.new(attributes[:year], attributes[:month], attributes[:day])
    Event.where(:start => "#{today.convert_to_sql}").sort_by_date
  end
end
