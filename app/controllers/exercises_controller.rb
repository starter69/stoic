class ExercisesController < ApplicationController
  # Before actions are a great way to DRY out the Controller.
  # I don't need to set Exercise for show, edit, update and destroy
  # again and again. Each INSTANCE of the ExercisesController,
  # when it is generated by the application when an action is called,
  # then sets the @exercise instance variable for that action.
  # My "check_ownership" method, which Christoph helped me with,
  # is also a great way to set up a check (which, when connected with
  # before_action can get repeated across other action methods) to test,
  # in this case, to ensure that the exercise is either global or YOURS
  # if you are viewing, editing, updating or destroying it.
  # A simplification for this logic would be to have two controllers, one
  # as an Admin controller. Then you could separate controls rather than
  # the logic in check_ownership and all the logic in the CanCan Ability model.
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_exercise, only: %i[show edit update destroy]
  before_action :check_ownership, only: %i[edit update destroy]

  # Load CanCan roles for Controller
  load_and_authorize_resource

  # GET /exercises
  def index
    @global_exercises = Exercise.where(global: true)
                                .order(:updated_at).reverse
    # I added .try here as part of adding the feature to enable
    # non-logged-in users to access the exercises. it is a Rails
    # method but an anti-pattern to use it too much.
    # IF you need to use .try elsewhere, instead create a kind of
    # "custom nil object", aka a "Guest" User, who has
    # zero private exercises, a "name" of guest, etc.
    @exercises = Exercise.where(user_id: current_user.try(:id))
    @latest_exercise = Exercise.where(global: true).last
  end

  # GET /exercises/1
  def show
    @rehearsals = @exercise.rehearsals_for_user(current_user)
    exercise_tags = @exercise.tags
    @published_doctrines = Doctrine.where(publish: true)
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
    3.times do
      question = @exercise.questions.build
      question.answers.build
    end
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user_id = current_user.id
    if @exercise.save
      redirect_to @exercise, notice: 'Exercise was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /exercises/1
  def update
    # assign_attributes is ActiveModel method often used in update to
    # add the params as attributes to the model object without/before
    # saving them. Then you can have logic inbetween, for example in our
    # case to call the CanCan method authorize! to check whether this user
    # is authorized to update/change this model / database table
    @exercise.assign_attributes(exercise_params)

    block_private_user_global_editing

    if @exercise.save
      redirect_to @exercise, notice: 'Exercise was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /exercises/1
  def destroy
    @exercise.destroy

    redirect_to action: 'index'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def check_ownership
    return if @exercise.user_id == current_user.id || @exercise.global?

    raise CanCan::AccessDenied.new(
      'You are not allowed to access this exercise, buddy!'
    )
  end

  def block_private_user_global_editing
    return if @exercise.user_id == current_user.id &&
              @exercise.global? == false ||
              current_user.admin? == true

    raise CanCan::AccessDenied.new(
      'You are not allowed to access this exercise, buddy!'
    )
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def exercise_params
    params.require(:exercise).permit(:_destroy,
                                     :title,
                                     :general_description,
                                     :category,
                                     :global,
                                     :buzzword,
                                     :tag_list,
                                     :icon,
                                     questions_attributes:
                                       %i[id inquiry _destroy])
  end
end
