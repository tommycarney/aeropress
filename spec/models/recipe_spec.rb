require 'rails_helper'

RSpec.describe Recipe do
  let :recipe { FactoryGirl.build_stubbed(:recipe)}
  let :americano { FactoryGirl.create(:recipe, :with_beverage_tag) }
  let :inverted { FactoryGirl.create(:recipe, :with_technique_tag) }

  describe "returns a list" do
    it "with beverage types" do
      recipe = americano
      expect(Recipe.beverage_names).to include("Americano")
    end

    it "with technique types" do
      recipe = inverted
      expect(Recipe.technique_names).to include("Inverted")
    end
  end

  subject { recipe }

  it {is_expected.to respond_to(:title) }
  it {is_expected.to respond_to(:description) }
  it {is_expected.to respond_to(:youtube_id) }

  it "has a beverage tag" do
   expect(americano.beverages.map(&:name)).to eq(["Americano"])
  end

  it "has a technique tag" do
   expect(inverted.techniques.map(&:name)).to eq(["Inverted"])
  end

  it "can be found via the beverage tag once saved to database " do
    americano.save
    expect(Recipe.tagged_with("Americano").to_a).to include(americano)
  end

  it "can be found via the technique tag once saved to database " do
    inverted.save
    expect(Recipe.tagged_with("Inverted")).to include(inverted)
  end
end
