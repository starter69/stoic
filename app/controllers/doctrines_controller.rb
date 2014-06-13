class DoctrinesController < ApplicationController
  before_action :set_doctrine, only: [:show, :edit, :update, :destroy]

  # GET /doctrines
  # GET /doctrines.json
  def index
    @doctrines = Doctrine.all
  end

  # GET /doctrines/1
  # GET /doctrines/1.json
  def show
  end

  # GET /doctrines/new
  def new
    @doctrine = Doctrine.new
  end

  # GET /doctrines/1/edit
  def edit
  end

  # POST /doctrines
  # POST /doctrines.json
  def create
    @doctrine = Doctrine.new(doctrine_params)

    respond_to do |format|
      if @doctrine.save
        format.html { redirect_to @doctrine, notice: 'Doctrine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @doctrine }
      else
        format.html { render action: 'new' }
        format.json { render json: @doctrine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctrines/1
  # PATCH/PUT /doctrines/1.json
  def update
    respond_to do |format|
      if @doctrine.update(doctrine_params)
        format.html { redirect_to @doctrine, notice: 'Doctrine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @doctrine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctrines/1
  # DELETE /doctrines/1.json
  def destroy
    @doctrine.destroy
    respond_to do |format|
      format.html { redirect_to doctrines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctrine
      @doctrine = Doctrine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctrine_params
      params.require(:doctrine).permit(:title, :explanation, :category)
    end
end
