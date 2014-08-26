require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/./lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def main_menu
  puts "\n\nCalendar"
  puts "1) Add, Delete, or List Events"
  puts "2) Add, Delete, or List To-Do's"
  puts "3) Add, Delete, or List Notes"
  puts "4) Exit"
  case gets.chomp.to_i
  when 1 then event_menu
  when 2 then to_do_menu
  when 3 then notes_menu
  when 4 then exit
  end
  main_menu
end

def event_menu
  puts "\n\n1) Create a new event"
  puts "2) Delete event"
  puts "3) View all events"
  puts "4) View events - future "
  puts "5) View events - today"
  puts "6) View events - yesterday"
  puts "7) View events - tomorrow"
  puts "8) View events - this week"
  puts "9) View events - last week"
  puts "10) View events - next week"
  puts "11) View events - this month"
  puts "12) View events - last month"
  puts "13) View events - next month"
  puts "14) Main Menu"

  case gets.chomp.to_i
    when 1 then create_event
    when 2 then delete_event
    when 3 then list_all_events
    when 4 then list_future
    when 5 then list_today
    when 6 then list_yesterday
    when 7 then list_tomorrow
    when 8 then list_this_week
    when 9 then list_last_week
    when 10 then list_next_week
    when 11 then list_this_month
    when 12 then list_last_month
    when 13 then list_next_month
    when 14 then main_menu
  end
  event_menu
end

def to_do_menu
  puts "\n\n1) Create a new to-do"
  puts "2) Delete a to-do"
  puts "3) View all to-dos"
  puts "4) Main Menu"

  case gets.chomp.to_i
    when 1 then create_to_do
    when 2 then delete_to_do
    when 3 then list_all_to_dos
    when 4 then main_menu
  end
  to_do_menu
end

def notes_menu
  puts "\n\n1) Create a new note"
  puts "2) Delete a note"
  puts "3) View all notes"
  puts "4) Main Menu"

  case gets.chomp.to_i
    when 1 then create_note
    when 2 then delete_note
    when 3 then list_all_notes
    when 4 then main_menu
  end
  notes_menu
end

def create_note
  puts "Enter the note description"
  description = gets.chomp
  puts "Enter [E] to attach to Event"
  puts "Enter [T] to attach to Note"
  type = gets.chomp.upcase
  if type == 'E'
    list_all_events
    type = 'event'
  elsif type == 'T'
    list_all_to_dos
    type = 'to_do'
  else
    puts "Invalid entry"
    create_note
  end
  puts "Item number"
  number = gets.chomp.to_i

  new_note = Note.new(description: description, doable_type: type, doable_id: number)

  if new_note.save
    puts "\n#{new_note.description} | Associated to: #{new_note.doable_type.upcase} with ID: #{new_note.doable_id} | created!"
  else
    puts "That wasn't a valid note:"
    new_to_do.errors.full_messages.each { |message| puts message }
  end
end

def delete_note
  list_all_notes
  puts "\nNote number to delete?"
  Note.find(gets.chomp.to_i).destroy
  puts "\nNote deleted"
end

def list_all_notes
  puts "\n\nAll Notes:"
  Note.all.each { |note| puts "#{note.id}. #{note.description} | Associated to: #{note.doable_type.upcase} with ID: #{note.doable_id}" }
end

def create_to_do
  puts "Enter the to-do description"
  description = gets.chomp
  new_to_do = To_do.new(description: description)
  if new_to_do.save
    puts "\n#{new_to_do.description} created!"
  else
    puts "That wasn't a valid to_do:"
    new_to_do.errors.full_messages.each { |message| puts message }
  end
end

def delete_to_do
  list_all_to_dos
  puts "\nTo-do number to delete?"
  To_do.find(gets.chomp.to_i).destroy
  puts "\nTo-do deleted"
end

def list_all_to_dos
  puts "\n\nAll To-do's:"
  To_do.all.each { |to_do| puts "#{to_do.id}. #{to_do.description}" }
end

def create_event
  puts "Enter the event description"
  description = gets.chomp
  puts "Enter the location of the event"
  location = gets.chomp
  puts "Enter the start date and time (YYYY-MM-DD [HH:MM:SS])"
  start_time = gets.chomp
  puts "Enter the end date and time (YYYY-MM-DD [HH:MM:SS])"
  end_time = gets.chomp
  new_event = Event.new(description: description, location: location, start: start_time, end: end_time)
  if new_event.save
    puts "\n#{new_event.description} created!"
  else
    puts "That wasn't a valid event:"
    new_event.errors.full_messages.each { |message| puts message }
  end
end

def delete_event
  list_all_events
  puts "\nEvent number to delete?"
  Event.find(gets.chomp.to_i).destroy
  puts "\nEvent deleted"
end

def list_all_events
  puts "\n\nAll Events:"
  Event.all.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_future
  puts "\n\nFuture Events:"
  Event.future.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_today
  puts "\n\nTodays Events:"
  Event.view_today.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_yesterday
  puts "\n\nYesterdays Events:"
  Event.view_yesterday.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_tomorrow
  puts "\n\nTomorrows Events:"
  Event.view_tomorrow.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_this_week
  puts "\n\nThis Weeks Events:"
  Event.view_this_week.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_last_week
  puts "\n\nLast Weeks Events:"
  Event.view_last_week.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_next_week
  puts "\n\nNext Weeks Events:"
  Event.view_next_week.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_this_month
  puts "\n\nThis Months Events:"
  Event.view_this_month.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_last_month
  puts "\n\nLast Months Events:"
  Event.view_last_month.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

def list_next_month
  puts "\n\nNext Months Events:"
  Event.view_next_month.each { |event| puts "#{event.id}. #{event.description} Start: #{event.start} End: #{event.end}"}
end

main_menu
