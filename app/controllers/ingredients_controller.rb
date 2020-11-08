class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:edit, :update]
  
  def index
    @ingredients = Ingredient.all
  end
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(strong_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredients_path
    else
      redirect_to new_ingredient_path
    end
  end

  def edit
  end

  def update
    @ingredient.assign_attributes(strong_params)
    if @ingredient.valid?
      @ingredient.update(strong_params)
      redirect_to ingredients_path
    else
      redirect_to edit_ingredient_path
    end
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def strong_params
    params.require(:ingredient).permit(:name)
  end

end
