require 'rails_helper'

#There is a problem here with the "type: model" part of the spec... not sure whether this is needed, I can't find this syntax in Everyday Rails, not sure where it came from. Maybe just get rid of it?

#RSpec.describe Meditation, type: model do
##list of descriptive things that this model does, which I can now begin to test. (This is the first step, just writing out this pseudocode.
#    it "saves title, passage and category to the database"
#    it "is taggable via meditation_taggings and tags"
#end

#Matthias: FactoryGirl, 3 core methods for building: create, build, and build_stubb. First use create to have most confidence. Build_stubb is less expensive as it does not save to the database. It creates a 'fake' id for the Model to talk to for associations etc.

#Next Step as of June 22 2016: 
# For some reason my calling even a simple "title" on the FactoryGirl "meditation" is failing. Get that working. One thing that I learned is that, and maybe confirm this with Matthias, but it appears from Everyday Rails page 57 that I DO need to actually CALL FactoryGirl in each Spec and CREATE, BUILD, or BUILD_STUBB in order to actually make USE of the configuration in my spec/factory/meditation Factory. I am making that call here, below. As Matthias pointed out I can use Let to MERGE or ADD to or OVERRIDE a Factory if I would like to. This is on occasion of use for example if I want to test a specific Model saving.

describe Meditation do

  describe '#title' do
    meditation = FactoryGirl.create(:meditation)
    subject { meditation.title }
    it 'has a valid factory' do
      expect(FactoryGirl.build(:meditation)).to be_valid
    end

    it 'returns a Meditation title' do
      expect(subject).to eq 'Dankenliste'
    end
  end

  describe '#tag_list' do
    meditation = FactoryGirl.create(:meditation, :with_tag)
    tags = meditation.tags
    it 'has a valid factory' do
      expect(tags).to be_valid
      #returning an Active Record Associations Object... should it be an RSPEC Factory object?
    end

    it 'returns a list of tag names' do
      expect(tags.each { |tag| tag.name }).to eq 'H Kaiser W'
        #In our normal application... I mean, from the Model perspective... how can I get an object to return me a quote unqoute comma-separated string of tag names? I mean... what about, I can just get a list of its tags named? well.. a .each do list. And I just tested that in the Controller. And now the only question is, how do you use RSPEC to test for a list? The other question is... how do we get out of this, it's returning a whole object instead of JUST the name...  RSPEC and loops... PLUS lastly the validation problem, how can I refresh the RSPEC test data each time, or have it not save permanently to the database?
    end
  end
#
#  describe '#allows?' do
#    subject { bouncer.allows?(person) }
#
#    let(:bouncer) { create(:bouncer) }
#    let(:person) { create(:person, :perfect, age: age)}
#
#    it { is_expected.to be_truthy }
#
#    context 'when person famous' do
#      let(:bouncer) { create(:bouncer) }
#      it 'returns true' do
#        person = create(:person, :famous)
#        expect(bouncer.allows?(person)).to eq true
#      end
#    end
#
#    context 'when too short' do
#      let(:person) { create(:person, :too_short) }
#      it { is_expected.to be_falsey }
#    end
#
#    context 'when too ugly' do
#      let(:person) { create(:person, :too_ugly) }
#      it { is_expected.to be_falsey }
#    end
#
#    context 'when person too young' do
#      let(:person) { create(:person, :too_young) }
#      it { is_expected.to be_falsey }
#    end
#  end
end
