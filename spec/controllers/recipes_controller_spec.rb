require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let :americano { FactoryGirl.create(:recipe, :with_beverage_tag) }
  let :inverted { FactoryGirl.create(:recipe, :with_technique_tag) }
  describe "get index" do
    it 'returns success, renders index and assigns recipes' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(assigns(:recipes)).to_not be_nil
    end

    it "responds to filter params" do
      americano_coffee = americano
      inverted_coffee = inverted
      get :index, params: {"recipe"=>{"beverage"=>"Americano"}}
      expect(response).to render_template(:index)
      expect(assigns(:recipes)).to include(americano_coffee)
      expect(assigns(:recipes)).to_not include(inverted_coffee)
    end
  end
  describe "creating a new recipe" do
    it "via a post to the create method " do
      expect {
        process :create, method: :post, params: { recipe: FactoryGirl.attributes_for(:recipe) }
      }.to change { Recipe.count }
    end
  end
end
