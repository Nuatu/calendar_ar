require 'spec_helper'
describe Note do
  it { should have_db_column :description }
  it { should validate_presence_of :description }
end
