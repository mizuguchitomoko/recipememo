class RecipesController < ApplicationController
  def top
  end

  def index
    @recipe = Recipe.new
    @recipes = Recipe.all.page(params[:page]).per(6)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    #@recipe.user_id = current_user.id
    @recipe.save!
    #redirect_to recipe_path(@recipe)
    redirect_to recipes_path
  end

  def show
    @recipe_new = Recipe.new
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipes_path
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_body, :image, :recipe_food)
  end
end
