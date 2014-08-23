require 'spec_helper'
describe Event do
  it { should have_db_column :description}
  it { should have_db_column :location }
  it { should have_db_column :start }
  it { should have_db_column :end }

  describe 'future' do
    it 'should list all future events by date' do
      test_event = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/05', :end => '2014/08/06 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2015/02/02', :end => '2015/02/03 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      expect(Event.future).to eq [test_event3, test_event2]
    end
  end

end



