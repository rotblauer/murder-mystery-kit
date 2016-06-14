class EventCharactersController < ApplicationController
  before_action :set_event_character, only: [:show, :edit, :update, :destroy]

  # GET /event_characters
  # GET /event_characters.json
  def index
    @event_characters = EventCharacter.all
  end

  # GET /event_characters/1
  # GET /event_characters/1.json
  def show
  end

  # GET /event_characters/new
  def new
    @event_character = EventCharacter.new
  end

  # GET /event_characters/1/edit
  def edit
  end

  # POST /event_characters
  # POST /event_characters.json
  def create
    @event_character = EventCharacter.new(event_character_params)

    respond_to do |format|
      if @event_character.save
        format.html { redirect_to @event_character, notice: 'Event character was successfully created.' }
        format.json { render :show, status: :created, location: @event_character }
      else
        format.html { render :new }
        format.json { render json: @event_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_characters/1
  # PATCH/PUT /event_characters/1.json
  def update
    respond_to do |format|
      if @event_character.update(event_character_params)
        format.html { redirect_to @event_character, notice: 'Event character was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_character }
      else
        format.html { render :edit }
        format.json { render json: @event_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_characters/1
  # DELETE /event_characters/1.json
  def destroy
    @event_character.destroy
    respond_to do |format|
      format.html { redirect_to event_characters_url, notice: 'Event character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_character
      @event_character = EventCharacter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_character_params
      params.require(:event_character).permit(:event_id, :character_id, :index)
    end
end
