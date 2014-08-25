require 'bundler/setup'
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.before(:each) do
    Event.all.each { |event| event.destroy }
    To_do.all.each { |event| event.destroy }
    Note.all.each { |event| event.destroy }
  end
end
