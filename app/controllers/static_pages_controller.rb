class StaticPagesController < ApplicationController

  def index
    static_pages_parameters.nil? ? @recipes = Recipe.order(:title): @recipes = Recipe.limit(params[:amount])
    @beverages = ActsAsTaggableOn::Tag.for_context(:beverages)
    @techniques = ActsAsTaggableOn::Tag.for_context(:techniques)
    respond_to do |format|
      format.html {}
      format.js { }
    end
  end

  private

  def static_pages_parameters
    params.permit(:amount)
  end
end
