class TagsController < ApplicationController
  def index
    @exercises = Exercise.tagged_with(params[:tag]).where(user_id:current_user.id)
    @global_exercises = Exercise.tagged_with(params[:tag]).where(global:true)
    @meditations = Meditation.all.tagged_with(params[:tag])
    @doctrines = Doctrine.all.tagged_with(params[:tag])
  end
end
