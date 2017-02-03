require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  describe '#show' do
    before do
      user = FactoryGirl.build_stubbed(:user)
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
  end
end
