class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :destroy]

  def index
    @doses = Dose.all
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  protected

  def update
  end

private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

end
