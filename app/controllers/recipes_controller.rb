class RecipesController < ApplicationController
  def top
  end

  def index
    @recipe = Recipe.new
    @recipes = Recipe.all
  end

  def show
    @recipe_new = Recipe.new
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    #@recipe.user_id = current_user.id
    @recipe.save!
    #redirect_to recipe_path(@recipe)
    render :"index"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_body, :image, :recipe_food)
  end
end
