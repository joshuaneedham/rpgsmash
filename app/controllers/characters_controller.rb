class CharactersController < ApplicationController
	before_action :set_current_user

  def index
    @universe = Universe.find(params[:universe_id])
    @characters = Universe.find(params[:universe_id]).characters
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])

    @character.update(character_params)

    if @character.save
      redirect_to @character
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
    params.require(:character).permit(:title, :description, :datatype)
  end
end

