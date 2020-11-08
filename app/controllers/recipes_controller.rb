class RecipesController < ApplicationController
  before_action :find_recipe, only: [:edit, :update]
  before_action :all_ingredients, only: [:new, :edit]
  
  def index
    @recipes = Recipe.all    
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(strong_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipes_path
    else
      redirect_to new_recipe_path
    end
  end

  def edit
  end

  def update
    @recipe.assign_attributes(strong_params)
    if @recipe.valid?
      @recipe.update(strong_params)
      redirect_to recipes_path
    else
      redirect_to edit_recipe_path
      # render :edit
    end
  end

  private

  def all_ingredients
    @ingredients = Ingredient.all
  end

  def find_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def strong_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
