class CharactersController < ApplicationController
	before_action :set_current_user

  def index
    @universe = Universe.find(params[:universe_id])
    @characters = Universe.find(params[:universe_id]).characters
  end

  def show
    @character = Character.find(params[:id])
    @universe = Universe.find(params[:universe_id])
  end

  def new
    @universe = Universe.find(params[:universe_id])
    @character = Character.new
    @character.construct_traits(params[:universe_id])
    @traits = @character.traits
  end

  def create
    @character = Character.new(character_params)
    @character.universe = Universe.find(params[:universe_id])
    if @character.save
      redirect_to universe_character_path(@character.universe, @character)
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
    @universe = Universe.find(params[:universe_id])
  end

  def update
    @character = Character.find(params[:id])
    @character.universe = Universe.find(params[:universe_id])
    @character.update(character_params)

    if @character.save
      redirect_to universe_character_path(@character.universe, @character)
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    flash[:notice] = "Character deleted."
    redirect_to characters_path
  end

  private

  def set_current_user
  	@user = current_user
  end

  def character_params
    params.require(:character).permit(
      :name, 
      :biography,
      traits_attributes: [
        :stat
      ]
    )
  end
end

