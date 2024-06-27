class Api::Vi::RecipesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_recipe, only: [:show, :destroy]
  def index
    @recipes = Recipe.all.order(created_at: :desc)
    render json: @recipes
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe
      render json: @recipe, status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @recipe
  end

  def destroy
    @recipe&.destroy
    render json: { message: "Recipe deleted successfully"}
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instruction)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
