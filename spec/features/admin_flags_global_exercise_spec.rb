require 'rails_helper'
require 'capybara/rails'
require 'spec_helpers/admin_steps'

RSpec.feature 'Admin Flags Global Exercise' do
  scenario 'New Exercise created' do
    sign_in_as_admin # put into before :each block
    create_exercise
    check_if_exercise_created # each expect should be in it's own it block
    visit_exercise_page
    check_if_exercise_is_local
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

  def check_if_exercise_now_tagged_as_global
    expect(page).to have_content 'Global Exercise'
  end
end
