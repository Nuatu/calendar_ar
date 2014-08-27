class Date
  def convert_to_sql
    "#{self.year}/#{self.month}/#{self.day} 00:00:00"
  end
end
