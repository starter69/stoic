require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  describe '#show' do
    let(:user) {FactoryGirl.build_stubbed(:user)}

    before do
      allow(controller).to receive(:authenticate_user!)
      allow(controller).to receive(:current_user).and_return(user)
    end

    it 'assigns the exercises ivar to the exercise for an id' do
      # Arrange, Act, Assert
      exercise = FactoryGirl.create(:exercise)
      get :show, id: exercise.id
      exercise_ivar = assigns(:exercise)
      expect(exercise_ivar).to eq(exercise)
    end

    it 'raises an active record error if the exercise does not exist' do
      expect {get :show, id: "invalid ID"}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'successfully fetches all rehearsals for that particular exercise for that particular user' do
      exercise = FactoryGirl.create(:exercise)
      rehearsal = FactoryGirl.create(:rehearsal, exercise: exercise, user: user)
      all_users_rehearsals_for_exercise = [rehearsal]

      get :show, id: exercise.id
      rehearsals_ivar = assigns(:rehearsals)

      expect(rehearsals_ivar).to eq(all_users_rehearsals_for_exercise)
    end

    it 'does not fetch other users rehearsals' do
      user_two = FactoryGirl.build_stubbed(:user)
      exercise = FactoryGirl.create(:exercise)
      rehearsal = FactoryGirl.create(:rehearsal, exercise: exercise, user: user_two)

      get :show, id: exercise.id
      rehearsals_ivar = assigns(:rehearsals)

      expect(rehearsals_ivar).to_not include(rehearsal)
    end
  end
end
