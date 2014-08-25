class Event < ActiveRecord::Base
  has_many :notes, :as => :doable
  validates :description, presence: true
  after_validation :normalize_description, :normalize_location, on: :create

  scope :future,          -> { where(:start => Time.now..'2400/01/01 12:00:00').sort_by_date }
  scope :view_today,      -> { where(:start => "#{DateTime.now.convert_to_sql}").sort_by_date }
  scope :view_yesterday,  -> { where(:start => "#{DateTime.now.yesterday.convert_to_sql}").sort_by_date }
  scope :view_tomorrow,   -> { where(:start => "#{DateTime.now.tomorrow.convert_to_sql}").sort_by_date }
  scope :view_this_week,  -> { where(:start => Time.now.beginning_of_week..Time.now.end_of_week).sort_by_date }
  scope :view_last_week,  -> { where(:start => Time.now.previous_week.beginning_of_week..Time.now.previous_week.end_of_week).sort_by_date }
  scope :view_next_week,  -> { where(:start => Time.now.next_week.beginning_of_week..Time.now.next_week.end_of_week).sort_by_date }
  scope :view_this_month, -> { where(:start => Time.now.beginning_of_month..Time.now.end_of_month).sort_by_date }
  scope :view_last_month, -> { where(:start => Time.now.last_month.beginning_of_month..Time.now.last_month.end_of_month).sort_by_date }
  scope :view_next_month, -> { where(:start => Time.now.next_month.beginning_of_month..Time.now.next_month.end_of_month).sort_by_date }

  private
    def normalize_description
      self.description != nil ? self.description = self.description.downcase.titleize : return
    end

    def normalize_location
      self.location != nil ? self.location = self.location.downcase.titleize : return
    end
end
