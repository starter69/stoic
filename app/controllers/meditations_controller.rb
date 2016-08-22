class MeditationsController < ApplicationController
  #Load CanCan roles for Controller
  load_and_authorize_resource

  before_action :set_meditation, only: [:show, :edit, :update, :destroy]

  # GET /meditations
  # GET /meditations.json
  def index
    @meditations = Meditation.all
    binding.pry
  end

  # GET /meditations/1
  # GET /meditations/1.json
  def show
  end

  # GET /meditations/new
  def new
    @meditation = Meditation.new
  end

  # GET /meditations/1/edit
  def edit
  end

  # POST /meditations
  # POST /meditations.json
  def create
    @meditation = Meditation.new(meditation_params)

    respond_to do |format|
      if @meditation.save
        format.html { redirect_to @meditation, notice: 'Meditation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meditation }
      else
        format.html { render action: 'new' }
        format.json { render json: @meditation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meditations/1
  # PATCH/PUT /meditations/1.json
  def update
    respond_to do |format|
      if @meditation.update(meditation_params)
        format.html { redirect_to @meditation, notice: 'Meditation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meditation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meditations/1
  # DELETE /meditations/1.json
  def destroy
    @meditation.destroy
    respond_to do |format|
      format.html { redirect_to meditations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meditation
      @meditation = Meditation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meditation_params
      params.require(:meditation).permit(:title, :passage, :tag_list)
    end
end
