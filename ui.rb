require 'bundler/setup'
Bundler.require(:default)


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])
