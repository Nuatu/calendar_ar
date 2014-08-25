require 'spec_helper'
describe To_do do
  it { should have_db_column :description}

  it { should have_many(:notes) }

  describe '.all' do
    it 'should list all to_dos' do
      test_to_do1 = To_do.create(:description => 'meeting')
      test_to_do2 = To_do.create(:description => 'son-birthday')
      test_to_do3 = To_do.create(:description => 'wedding')
      test_to_do4 = To_do.create(:description => 'daughter_birthday')
      test_to_do5 = To_do.create(:description => 'wife_birthday')
      expect(To_do.all).to eq [test_to_do1, test_to_do2, test_to_do3, test_to_do4, test_to_do5]
    end
  end
end
