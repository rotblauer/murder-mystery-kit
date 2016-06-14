class EveningsController < ApplicationController
  before_action :set_evening, only: [:show, :edit, :update, :destroy]

  # GET /evenings
  # GET /evenings.json
  def index
    @evenings = Evening.all
  end

  # GET /evenings/1
  # GET /evenings/1.json
  def show
  end

  # GET /evenings/new
  def new
    @evening = Evening.new
  end

  # GET /evenings/1/edit
  def edit
  end

  # POST /evenings
  # POST /evenings.json
  def create
    @evening = Evening.new(evening_params)

    respond_to do |format|
      if @evening.save
        format.html { redirect_to @evening, notice: 'Evening was successfully created.' }
        format.json { render :show, status: :created, location: @evening }
      else
        format.html { render :new }
        format.json { render json: @evening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evenings/1
  # PATCH/PUT /evenings/1.json
  def update
    respond_to do |format|
      if @evening.update(evening_params)
        format.html { redirect_to @evening, notice: 'Evening was successfully updated.' }
        format.json { render :show, status: :ok, location: @evening }
      else
        format.html { render :edit }
        format.json { render json: @evening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evenings/1
  # DELETE /evenings/1.json
  def destroy
    @evening.destroy
    respond_to do |format|
      format.html { redirect_to evenings_url, notice: 'Evening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evening
      @evening = Evening.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evening_params
      params.require(:evening).permit(:host_id, :game_id, :location, :caveat)
    end
end
