class RecipesController < ApplicationController
  def top
  end

  def index
    @recipe = Recipe.new
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    #@recipe.user_id = current_user.id
    @recipe.save!
    #redirect_to recipe_path(@recipe)
    render :"top"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_body, :image)
  end
end
