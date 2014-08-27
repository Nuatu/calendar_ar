require 'spec_helper'
describe Note do
  it { should have_db_column :description }
  it { should validate_presence_of :description }

  it { should belong_to :doable }
  it { should belong_to :doable }


  describe '.all' do
    it 'should list all notes' do
      note1 = Note.create(:description => 'meeting')
      note2 = Note.create(:description => 'son-birthday')
      note3 = Note.create(:description => 'wedding')
      note4 = Note.create(:description => 'daughter_birthday')
      note5 = Note.create(:description => 'wife_birthday')
      expect(Note.all).to eq [note1, note2, note3, note4, note5]
    end
  end
end
