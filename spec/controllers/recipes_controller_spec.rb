require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "get index" do
    it 'has a 200 response code' do
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:recipes)).to_not be_nil
    end

    it "responds to query strings" do
      get :index, params: {"amount"=>"1"}
      expect(response).to render_template(:index)
      expect(assigns(:recipes)).to_not be_nil
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
