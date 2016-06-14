class GuestCharactersController < ApplicationController
  before_action :set_guest_character, only: [:show, :edit, :update, :destroy]

  # GET /guest_characters
  # GET /guest_characters.json
  def index
    @guest_characters = GuestCharacter.all
  end

  # GET /guest_characters/1
  # GET /guest_characters/1.json
  def show
  end

  # GET /guest_characters/new
  def new
    @guest_character = GuestCharacter.new
  end

  # GET /guest_characters/1/edit
  def edit
  end

  # POST /guest_characters
  # POST /guest_characters.json
  def create
    @guest_character = GuestCharacter.new(guest_character_params)

    respond_to do |format|
      if @guest_character.save
        format.html { redirect_to @guest_character, notice: 'Guest character was successfully created.' }
        format.json { render :show, status: :created, location: @guest_character }
      else
        format.html { render :new }
        format.json { render json: @guest_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_characters/1
  # PATCH/PUT /guest_characters/1.json
  def update
    respond_to do |format|
      if @guest_character.update(guest_character_params)
        format.html { redirect_to @guest_character, notice: 'Guest character was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest_character }
      else
        format.html { render :edit }
        format.json { render json: @guest_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_characters/1
  # DELETE /guest_characters/1.json
  def destroy
    @guest_character.destroy
    respond_to do |format|
      format.html { redirect_to guest_characters_url, notice: 'Guest character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_character
      @guest_character = GuestCharacter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_character_params
      params.require(:guest_character).permit(:evening_id, :guest_id, :character_id, :index)
    end
end
