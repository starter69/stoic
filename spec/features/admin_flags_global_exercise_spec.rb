require 'rails_helper'
require 'capybara/rails'
require 'spec_helpers/admin_steps'

RSpec.feature 'Admin Flags Global Exercise' do
  scenario 'Exercise is unflagged' do
    sign_in_as_admin
    create_exercise
    flag_it_as_global
    check_if_exercise_now_tagged_as_global
  end

  scenario 'Exercise is already flagged' do
    sign_in_as_admin
    create_exercise
    flag_it_as_global
    unflag_it_ie_make_it_local
    check_if_exercise_now_tagged_as_local
  end

  # tick global checkbox next to an exercise
  def check_if_exercise_now_tagged_as_global
    expect(@exercise.global?).to eq true
    # expect(@exercise.title).to eq 1
  end

  # untick global checkbox next to an exercise
  def check_if_exercise_now_tagged_as_local
    expect(@exercise.global?).to eq false
  end
end
