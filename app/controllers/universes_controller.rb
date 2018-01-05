class UniversesController < ApplicationController
	before_action :set_current_user

  def index
  	@universes = Universe.all
  end

  def show
    @universe = Universe.find(params[:id])
  end

  def new
    @universe = Universe.new
  end

  def create
    @universe = Universe.new(universe_params)

    if @universe.save
      redirect_to @universe
    else
      render :new
    end
  end

  def edit
    @universe = Universe.find(params[:id])
  end

  def update
    @universe = Universe.find(params[:id])

    @universe.update(universe_params)

    if @universe.save
      redirect_to @universe
    else
      render :edit
    end
  end

  def destroy
    @universe = Universe.find(params[:id])
    @universe.destroy
    flash[:notice] = "Universe deleted."
    redirect_to universes_path
  end

  private

  def set_current_user
  	@user = current_user
  end

  #def universe_params
  #  params.require(:universe).permit(:title, :description)
  #end
end

