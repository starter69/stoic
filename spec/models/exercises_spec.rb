require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe '#rehearsals_for_user' do
    it 'successfully fetches all rehearsals for that particular exercise for that particular user' do
      user = FactoryGirl.build_stubbed(:user)
      exercise = FactoryGirl.create(:exercise)
      rehearsal = FactoryGirl.create(:rehearsal, exercise: exercise, user: user)

      actual = exercise.rehearsals_for_user(user)

      expected = [rehearsal]
      expect(actual).to eq(expected)
    end

    it 'does not fetch other users rehearsals' do
      user = FactoryGirl.build_stubbed(:user)
      user_two = FactoryGirl.build_stubbed(:user)
      exercise = FactoryGirl.create(:exercise)
      rehearsal = FactoryGirl.create(:rehearsal, exercise: exercise, user: user_two)

      actual = exercise.rehearsals_for_user(user)

      expect(actual).to_not include(rehearsal)
    end
  end
end
