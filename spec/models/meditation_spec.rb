require 'rails_helper'

#There is a problem here with the "type: model" part of the spec... not sure whether this is needed, I can't find this syntax in Everyday Rails, not sure where it came from. Maybe just get rid of it?

#RSpec.describe Meditation, type: model do
##list of descriptive things that this model does, which I can now begin to test. (This is the first step, just writing out this pseudocode.
#    it "saves title, passage and category to the database"
#    it "is taggable via meditation_taggings and tags"
#end

describe Meditation do
  describe '#tag_list' do
    subject { meditation.tag_list }

    let(:meditation) { create(:meditation) }
    let(:first_tag)  { create(:tag, meditation: meditation, name: 'Seneca') }
    let(:second_tag) { create(:tag, meditation: meditation, name: 'Matthias') }

    it 'returns a comma separated string of tag names' do
      expect(subject).to eq 'Seneca, Matthias'
    end
  end

  describe '#allows?' do
    subject { bouncer.allows?(person) }

    let(:bouncer) { create(:bouncer) }
    let(:person) { create(:person, :perfect, age: age)}

    it { is_expected.to be_truthy }

    context 'when person famous' do
      let(:bouncer) { create(:bouncer) }
      it 'returns true' do
        person = create(:person, :famous)
        expect(bouncer.allows?(person)).to eq true
      end
    end

    context 'when too short' do
      let(:person) { create(:person, :too_short) }
      it { is_expected.to be_falsey }
    end

    context 'when too ugly' do
      let(:person) { create(:person, :too_ugly) }
      it { is_expected.to be_falsey }
    end

    context 'when person too young' do
      let(:person) { create(:person, :too_young) }
      it { is_expected.to be_falsey }
    end
  end
end
