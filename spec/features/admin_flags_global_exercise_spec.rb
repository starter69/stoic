require 'rails_helper'
require 'capybara/rails'



RSpec.feature 'Admin Flags Global Exercise' do
  scenario 'Exercise is unflagged' do
    sign_in_as_admin
    create_exercise
    flag_it_as_global
    check_if_exercise_now_tagged_as_global
  end

  def sign_in_as_admin
    @admin_user = User.new
    @admin_user.admin = true
    @admin_user.email = "henryvw@gmail.com"
    @admin_user.password = "saintfrancis"
    @admin_user.save!
    visit new_user_session_path
    fill_in "user_email", with: "henryvw@gmail.com"
    fill_in "user_password", with: "saintfrancis"
    click_button "Log in"
  end
  def create_exercise
    @exercise = Exercise.new
    @exercise.title = "test title"
    @exercise.user_id =  @admin_user.id
    @exercise.save!
  end
  def flag_it_as_global
    visit edit_exercise_path(@exercise.id)
    save_and_open_page
    binding.pry
    check 'Publish this exercise globally to all stoic compass users'
  end


    # tick global checkbox next to an exercise

  def check_if_exercise_now_tagged_as_global
    expect(@exercise.global?).to eq true
  end
end
