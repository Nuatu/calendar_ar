class Array
  def sort_by_date
    self.sort { |a,b| a.start <=> b.start }
  end
end

class Date
  def convert_to_sql
    "#{self.year}/#{self.month}/#{self.day} 00:00:00"
  end
end
