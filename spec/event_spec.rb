require 'spec_helper'
describe Event do
  it { should have_db_column :description}
  it { should have_db_column :location }
  it { should have_db_column :start }
  it { should have_db_column :end }

  it { should have_many(:notes) }

  describe 'future' do
    it 'should list future events by date' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.future).to eq [test_event3]
    end
  end

  describe '.view_today' do
    it 'should list todays events' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_today).to eq [test_event2]
    end
  end

  describe '.view_yesterday' do
    it 'should list todays events' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_yesterday).to eq [test_event4]
    end
  end

  describe '.view_tomorrow' do
    it 'should list tomorrows events' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_tomorrow).to eq [test_event5]
    end
  end

  describe '.view_this_week' do
    it 'should list events for the current week' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24 12:00:01', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_this_week).to eq [test_event2, test_event5]
    end
  end

   describe '.view_last_week' do
    it 'should list events for last week' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24 12:00:01', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_last_week).to eq [test_event1, test_event4]
    end
  end

   describe '.view_next_week' do
    it 'should list events for next week' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24 12:00:01', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_next_week).to eq [test_event3]
    end
  end

  describe '.view_this_month' do
    it 'should list events for the current month' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24 12:00:01', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_this_month).to eq [test_event1, test_event4, test_event2, test_event5]
    end
  end

  describe '.view_last_month' do
    it 'should list events for last month' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24 12:00:01', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      test_event6 = Event.create(:description => 'weekend-clubbing', :location => '5th-ave-nightclub', :start => '2014/07/28', :end => '2014/07/29 12:00:00')
      expect(Event.view_last_month).to eq [test_event6]
    end
  end

  describe '.view_next_month' do
    it 'should list events for next month' do
      test_event1 = Event.create(:description => 'meeting', :location => 'work', :start => '2014/08/18', :end => '2014/08/19 12:00:00')
      test_event2 = Event.create(:description => 'son-birthday', :location => 'chuck-e-cheese', :start => '2014/08/24 12:00:01', :end => '2014/08/25 12:00:00')
      test_event3 = Event.create(:description => 'wedding', :location => '5th-st-reception-hall', :start => '2014/09/03', :end => '2014/09/04 12:00:00')
      test_event4 = Event.create(:description => 'daughter-birthday', :location => 'bowling-alley', :start => '2014/08/23', :end => '2014/08/24 12:00:00')
      test_event5 = Event.create(:description => 'wife-birthday', :location => 'italian-restaurant', :start => '2014/08/25', :end => '2014/08/26 12:00:00')
      expect(Event.view_next_month).to eq [test_event3]
    end
  end
end



