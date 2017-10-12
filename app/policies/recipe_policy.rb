class RecipePolicy < ApplicationPolicy

  def update?
    admins.include?(user.try(:type))
  end

  def destroy?
    admins.include?(user.try(:type))
  end
end
