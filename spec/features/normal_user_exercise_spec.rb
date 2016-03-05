require 'rails_helper'
require 'capybara/rails'
require 'spec_helpers/create_exercise_steps'
require 'spec_helpers/user_steps'

RSpec.feature 'Normal User Manages Exercise' do
  before :each do
    sign_in_as_normal_user
    create_exercise
    set_exercise_owned_by_normal_user
  end

  scenario 'New Exercise created' do
    check_if_exercise_created
  end

  scenario 'Exercise should be local' do
    visit_exercise_page
    check_if_exercise_is_local
  end

  scenario 'User CANNOT flag Exercise as Global' do
    visit_exercise_page
    check_that_edit_exercise_link_is_removed
    check_if_exercise_still_tagged_as_local
  end
 
  def check_if_exercise_created
    expect(@exercise.id?).to eq true
  end

  def check_if_exercise_is_local
    expect(page).to have_content 'Custom Exercise'
  end

  def check_that_edit_exercise_link_is_removed
    expect(page).not_to have_content 'Edit Exercise'
  end
end
