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
  @exercise.general_description = "test description"
  @exercise.user_id =  @admin_user.id
  @exercise.save!
end

def flag_it_as_global
  visit edit_exercise_path(@exercise.id)
  check 'exercise[global]'
  @exercise.global = true
  click_button "Save Exercise"
  save_and_open_page
end

def unflag_it_ie_make_it_local
  visit edit_exercise_path(@exercise.id)
  check 'exercise[global]'
  @exercise.global = false
  click_button "Save Exercise"
  save_and_open_page
end
