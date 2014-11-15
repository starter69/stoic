class TagsController < ApplicationController
  def index
    @exercises = Exercise.where(user_id:current_user.id).tagged_with(params[:tag])
    @global_exercises = Exercise.where(global:true).tagged_with(params[:tag])
    @meditations = Meditation.all.tagged_with(params[:tag])
  end
end
