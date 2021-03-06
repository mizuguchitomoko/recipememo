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
    @recipe.user_id = current_user.id
    @recipe.save!
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe_new = Recipe.new
    @recipe = Recipe.find(params[:id])
    @recipe_comments = RecipeComment.all
    @recipe_comment = RecipeComment.new
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

  def favorites
    @recipe = Recipe.find(params[:id])
    @recipes = @recipe.favorites.all.page(params[:page]).per(6)
    @user = @recipe.user
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:recipe_title, :recipe_body, :image, :recipe_food, category_ids: [])
  end
end
