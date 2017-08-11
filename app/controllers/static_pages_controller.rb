class StaticPagesController < ApplicationController

  def index
    @recipes = Recipe.order(:title)
  end
end
