class DosesController < ApplicationController
  before_action :set_dose, only: [:new, :create]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new # equivalent à @cocktail.doses.build
  end

  def create
    set_dose
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    #@dose.ingredient = Ingredient.find(params[:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
