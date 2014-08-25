require 'spec_helper'
describe To_do do
  it { should have_db_column :description}

  it { should have_many(:notes) }
end
