class Recipe < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :beverages, :techniques
  scope :beverage, -> (beverage){ tagged_with(beverage) }
  scope :technique, -> (technique) { tagged_with(technique) }


  def self.beverage_names
    Recipe.beverage_counts.map{|beverage| beverage.name }
  end

  def self.technique_names
    Recipe.technique_counts.map{|technique| technique.name }
  end

end
