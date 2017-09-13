class Recipe < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :beverages, :techniques

end
