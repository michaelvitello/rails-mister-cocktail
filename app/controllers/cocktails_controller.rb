class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    if params[:query]
      if !Cocktail.joins(:ingredients).where("lower(ingredients.name) LIKE ?", "%#{params[:query].downcase}%").empty?
        @cocktails = Cocktail.joins(:ingredients).where("lower(ingredients.name) LIKE ?", "%#{params[:query].downcase}%")
      elsif !Cocktail.where("lower(name) LIKE ?", "%#{params[:query].downcase}%").empty?
        @cocktails = Cocktail.where("lower(name) LIKE ?", "%#{params[:query].downcase}%")
      else
        @cocktails = Cocktail.all
      end
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @dose = Dose.new
  end

  def edit
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  protected

  def update
  end

  def destroy
  end

private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
