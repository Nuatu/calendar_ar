class Event < ActiveRecord::Base
  scope :future, -> { where(:start => Time.now..'2400/01/01 12:00:00').sort_by_date }
  scope :view_today, -> { where(:start => "#{DateTime.now.convert_to_sql}").sort_by_date }
  scope :view_this_week, -> { where(:start => Time.now.beginning_of_week..Time.now.end_of_week).sort_by_date }
  scope :view_this_month, -> { where(:start => Time.now.beginning_of_month..Time.now.end_of_month).sort_by_date }


end
