require 'spec_helper'
describe Event do
  it { should have_db_column :description}
  it { should have_db_column :location }
  it { should have_db_column :start }
  it { should have_db_column :end }

  describe 'future' do
    it 'should list future events by date' do
      test_event = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/23', :end => '2014/08/23 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      expect(Event.future).to eq [test_event3]
    end
  end

  describe '.view_day' do
    it 'should list todays events (or yesterdays or tomorrows given proper argument)' do
      test_event = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/22', :end => '2014/08/23 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/24', :end => '2014/08/25 12:00:00')
      expect(Event.view_today).to eq [test_event2]
    end
  end

  describe '.view_week' do
    it 'should list events for the current week' do
      test_event = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/23', :end => '2014/08/23 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      expect(Event.view_this_week).to eq [test_event, test_event2]
    end
  end

  describe '.view_month' do
    it 'should list events for the current month' do
      test_event = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/23', :end => '2014/08/23 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'weekend-clubbing', :location => '5th-ave-nightclub', :start => '2014/08/30', :end => '2014/08/31 12:00:00')
      expect(Event.view_this_month).to eq [test_event, test_event2, test_event4]
    end
  end

end



