require 'rails_helper'
require 'capybara/rails'
require 'spec_helpers/admin_steps'

RSpec.feature 'Normal User Uses Global Exercise' do
  before :each do
    sign_in_as_normal_user
    create_exercise
  end

  scenario 'New Exercise created' do
    check_if_exercise_created
  end

  scenario 'Exercise should be local' do
    visit_exercise_page
    check_if_exercise_is_local
  end

  scenario 'Exercise should NOT be flaggable as global' do
    visit_edit_exercise_page
    flag_it_as_global
    check_if_exercise_now_tagged_as_global
  end

  def check_if_exercise_created
    expect(@exercise.id?).to eq true
  end

  def check_if_exercise_is_local
    expect(page).to have_content 'Custom Exercise'
  end

  def check_if_exercise_still_tagged_as_local
    expect(page).to have_content 'Custom Exercise'
  end
end
