def create_exercise
  @exercise = Exercise.new
  @exercise.title = "test title"
  @exercise.general_description = "test description"
  @exercise.save!
end

def set_exercise_owned_by_normal_user
  @exercise.user_id = @normal_user.id
end

def set_exercise_owned_by_admin_user
  @exercise.user_id = @admin_user.id
end

def visit_exercise_page
  visit exercise_path(@exercise.id)
end

def visit_edit_exercise_page
  visit edit_exercise_path(@exercise.id)
end
