class PermalinksController < ApplicationController
  def show
    recipe = Recipe.where(shortcode: params[:shortcode]).first!
    redirect_to recipe_path(recipe)      
  end
end
