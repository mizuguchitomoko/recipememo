class RecipeCommentsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = current_user.recipe_comments.new(comment_params)
    comment.recipe_id = recipe.id
    comment.save
    redirect_to recipe_path(recipe)
  end

  def destroy

  end

  private
  def comment_params
    params.require(:recipe_comment).permit(:comment)
  end
end
