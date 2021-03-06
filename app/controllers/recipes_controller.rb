class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]



  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.where(nil)
    if params[:recipe].present?
      filtering_params(params).each do |key, value|
        @recipes = @recipes.public_send(key, value) if value.present?
      end
    end
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    authorize @recipe
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @recipe
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    authorize @recipe
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :youtube_id, :beverage, :technique, :beverage_list, :technique_list)
    end

    def filtering_params(params)
      params.require(:recipe).permit(:beverage, :technique)
    end
end
