class Array
  def sort_by_date
    self.sort { |a,b| a.start <=> b.start }
  end
end
