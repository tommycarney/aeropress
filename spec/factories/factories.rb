FactoryGirl.define do
  factory :recipe do
    title { "A title #{rand(50)}"}
    description { "A description #{rand(50)}" }
    youtube_id { "PMqjk2jZ4#{rand(50)}" }

    trait :with_beverage_tag do
      after(:build) { |recipe| recipe.set_tag_list_on(:beverages, "Americano") }
    end
    trait :with_technique_tag do
      after(:build) {|recipe| recipe.set_tag_list_on(:technique, "Inverted")}
    end
  end
end
