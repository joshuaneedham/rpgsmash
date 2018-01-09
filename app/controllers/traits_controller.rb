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
    @universe = Universe.find(params[:universe_id])
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(trait_params)
    @trait.universe = Universe.find(params[:universe_id])
    if @trait.save
      redirect_to universe_trait_path(@trait.universe, @trait)
    else
      render :new
    end
  end

  def edit
    @trait = Trait.find(params[:id])
    @universe = Universe.find(params[:universe_id])
  end

  def update
    @trait = Trait.find(params[:id])
    @trait.universe = Universe.find(params[:universe_id])
    @trait.update(trait_params)

    if @trait.save
      redirect_to universe_trait_path(@trait.universe, @trait)
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
    if current_user
  	  @user = current_user
    else
      @user = User.find(:id => params[:user_id])
    end
  end

  def trait_params
    params.require(:trait).permit(:name, :description, :datatype)
  end
end

