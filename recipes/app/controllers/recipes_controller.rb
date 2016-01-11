class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def like
    recipe = Recipe.find(params[:id])

    recipe.likes += 1
    recipe.save!

    redirect_to recipe_path(recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(
    :name, :description, :preparation_time, :servings_yieldeds)
  end
end
