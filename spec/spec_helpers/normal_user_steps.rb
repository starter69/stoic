def sign_in_as_normal_user
  @normal_user = User.new
  @normal_user.admin = false
  @normal_user.email = "henry_normal_user@gmail.com"
  @normal_user.password = "feastoftheepiphany"
  @normal_user.save!
  visit new_user_session_path
  fill_in "user_email", with: "henry_normal_user@gmail.com"
  fill_in "user_password", with: "feastoftheepiphany"
  click_button "Log in"
end

def create_exercise
  @exercise = Exercise.new
  @exercise.title = "test title"
  @exercise.general_description = "test description"
  @exercise.user_id = @normal_user.id
  @exercise.save!
end

def visit_exercise_page
  visit exercise_path(@exercise.id)
end

def visit_edit_exercise_page
  visit edit_exercise_path(@exercise.id)
end

def flag_it_as_global
  check 'exercise[global]'
  fill_in 'exercise_title', with: @exercise.user_id
  click_button 'Save Exercise'
  save_and_open_page
end
