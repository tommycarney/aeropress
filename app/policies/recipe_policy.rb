class RecipePolicy < ApplicationPolicy

  def edit?
    admins.include?(user.try(:type))
  end
end
