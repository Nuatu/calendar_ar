require 'spec_helper'
describe Note do
  it { should have_db_column :description }
end
