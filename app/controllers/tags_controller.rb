class TagsController < ApplicationController
  def index
    @global_exercises = Exercise.tagged_with(params[:tag]).where(global:true)
    @quotations = Quotation.all.tagged_with(params[:tag])
    @doctrines = Doctrine.all.tagged_with(params[:tag])
    #Just needs a bit of work to get the below custom exercises included in the tags. 
    #if user_signed_in?  
    #  @exercises = Exercise.tagged_with(params[:tag]).where(user_id:current_user.id)
    #end
  end
end
