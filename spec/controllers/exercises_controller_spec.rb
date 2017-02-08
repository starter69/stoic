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

    context 'when the exercise has no tags' do
      it 'doctrines ivar is nil' do
        exercise = FactoryGirl.create(:exercise)

        get :show, id: exercise.id 
        doctrines_ivar = assigns(:doctrines) 

        expect(doctrines_ivar).to be_nil
      end
    end

    context 'when the exercise has tags' do
      it 'tags ivar is set to the exercises ivars tags' do
        exercise = FactoryGirl.create(:exercise)
        tag = FactoryGirl.create(:tag)
        exercise_tagging = FactoryGirl.create(:exercise_tagging, exercise: exercise, tag: tag)
        exercise_tags = [tag]

        get :show, id: exercise.id
        tags_ivar = assigns(:tags)

        expect(tags_ivar).to eq(exercise_tags)
      end

      context 'when the first tag associated with an exercise has no doctrines' do
        it 'sets the doctrines ivar to be empty' do
          exercise = FactoryGirl.create(:exercise)
          tag = FactoryGirl.create(:tag)
          exercise_tagging = FactoryGirl.create(:exercise_tagging, exercise: exercise, tag: tag)

          get :show, id: exercise.id
          doctrines_ivar = assigns(:doctrines)

          expect(doctrines_ivar).to be_empty
        end
      end
      
      context 'when the first tag associated with an exercise has doctrines' do
        it 'sets the doctrines ivar to the doctrines associated with the first tag' do
          exercise = FactoryGirl.create(:exercise)
          tag = FactoryGirl.create(:tag)
          exercise_tagging = FactoryGirl.create(:exercise_tagging, exercise: exercise, tag: tag)
          doctrine = FactoryGirl.create(:doctrine)
          doctrine_tagging = FactoryGirl.create(:doctrine_tagging, tag: tag, doctrine: doctrine)
          doctrines_for_first_tag = [doctrine]

          get :show, id: exercise.id
          doctrines_ivar = assigns(:doctrines)

          expect(doctrines_ivar).to eq(doctrines_for_first_tag)
        end
      end
    end
  end
end
