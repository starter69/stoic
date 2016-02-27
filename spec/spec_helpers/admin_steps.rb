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
  fill_in 'exercise_title', with: @exercise.user_id
  click_button "Save Exercise"
  save_and_open_page
end

def unflag_it_ie_make_it_local
  visit edit_exercise_path(@exercise.id)
  check 'exercise[global]'
  click_button "Save Exercise"
end

#The main issue is that I'm cheating. I've been setting @exercise.global = true rather than relying on the interface. I'm testing with fill_in to see what is working and what isn't about the check exexercise[global]. Why does it update in the browser the title, to 1, but in binding.pry it still says the title is the original test title? Is exercise[global] really the right tick box? In essence, we have the same problem. I just tried making the test test for title... and it also shows the title as "test title." So in both cases it appears, what is showing up on the browser is not what the tests are getting. And not just the tests... binding.pry also sees non-updated @exercise. It could be that... hmm... these dummy capybara view updates aren't updating to the actual @exericse... like you can click buttons and do stuff, but it doesn't actually change @exercise. Is that possible?
