class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'beyond meat')

  end

  def create
    @recipe=Recipe.create(actual_params)
    redirect_to recipe_path(@recipe.id)
  end

  private
 
  def actual_params
    params.require(:recipe).permit(:title,ingredients_attributes:[:name,:quantity])
  end
    

end
