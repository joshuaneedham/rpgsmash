class TraitsController < ApplicationController
	before_action :set_current_user

  def index
    @universe = Universe.find(params[:universe_id])
    @traits = Universe.find(params[:universe_id]).traits
  end

  def show
    @trait = Trait.find(params[:id])
  end

  def new
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(trait_params)

    if @trait.save
      redirect_to @trait
    else
      render :new
    end
  end

  def edit
    @trait = Trait.find(params[:id])
  end

  def update
    @trait = Trait.find(params[:id])

    @trait.update(trait_params)

    if @trait.save
      redirect_to @trait
    else
      render :edit
    end
  end

  def destroy
    @trait = Trait.find(params[:id])
    @trait.destroy
    flash[:notice] = "Trait deleted."
    redirect_to traits_path
  end

  private

  def set_current_user
  	@user = current_user
  end

  def trait_params
    params.require(:trait).permit(:title, :description, :datatype)
  end
end

